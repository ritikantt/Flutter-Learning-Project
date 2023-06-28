import 'package:flutter/material.dart';

import '../../models/income.dart';

class IncomeItem extends StatelessWidget {
  const IncomeItem(this.income, {super.key});

  final Income income;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(income.formattedDate),
            const Spacer(),
            Text(income.title),
            const Spacer(),
            Text('₹${income.amount.toString()}'),
            const Spacer(),
            Text('₹${income.dividend.toString()}'),
          ],
        ),
      ),
    );
  }
}
