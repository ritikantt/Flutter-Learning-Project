import 'package:flutter/material.dart';
import '../../models/expense.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final _addExpenseFormKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  var _enteredAmount = 1;
  var _selectedDate = DateTime.now();

  void _displayDatePicker() async {
    final today = DateTime.now();
    final firstDate = DateTime(today.year, today.month - 6, today.day);
    final expenseDate = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: firstDate,
        lastDate: today);
    setState(() {
      _selectedDate = expenseDate!;
    });
  }

  void _submitExpense() {
    if (_addExpenseFormKey.currentState!.validate()) {
      _addExpenseFormKey.currentState!.save();
      widget
          .onAddExpense(Expense(_enteredTitle, _enteredAmount, _selectedDate));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _addExpenseFormKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 15,
                decoration: const InputDecoration(
                    label: Text('Expense Title'), border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 4 ||
                      value.trim().length > 15) {
                    return 'Must be between 4 and 15 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text('Amount'),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Must be a valid and positive number.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredAmount = int.parse(value!);
                        }),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Text(
                          formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _displayDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ])),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitExpense,
                child: const Text('Add Expense'),
              ),
            ],
          )),
    );
  }
}
