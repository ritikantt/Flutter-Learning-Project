import 'package:flutter/material.dart';
import 'package:income_expense_assignment/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(expense.formattedDate),
            const Spacer(),
            Text(expense.title),
            const Spacer(),
            Text('₹${expense.amount.toString()}'),
          ],
        ),
      ),
    );
  }
}
