import 'package:flutter/material.dart';
import 'package:income_expense_assignment/widgets/expenses/expense_item.dart';

import '../data/expense_dummy.dart';
import '../models/expense.dart';
import '../widgets/expenses/add_expense.dart';

final List<Expense> _expensesList = expenseDummy;

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({
    super.key,
  });

  @override
  State<ExpenseScreen> createState() {
    return _ExpenseScreenState();
  }
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expensesList.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _expensesList.length,
        itemBuilder: (ctx, index) => ExpenseItem(_expensesList[index]),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _openAddExpenseOverlay,
        child: const Text('Add Expense'),
      ),
    );
  }
}
