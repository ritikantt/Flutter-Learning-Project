import 'package:flutter/material.dart';

import '../data/income_dummy.dart';
import '../models/income.dart';
import '../widgets/expenses/add_income.dart';
import '../widgets/expenses/income_item.dart';

final List<Income> _incomeList = incomeDummy;

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({
    super.key,
  });

  @override
  State<IncomeScreen> createState() {
    return _IncomeScreenState();
  }
}

class _IncomeScreenState extends State<IncomeScreen> {
  void _openAddIncomeOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddIncome(onAddIncome: _addIncome),
    );
  }

  void _addIncome(Income income) {
    setState(() {
      _incomeList.add(income);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _incomeList.length,
        itemBuilder: (ctx, index) => IncomeItem(_incomeList[index]),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _openAddIncomeOverlay,
        child: const Text('Add Income'),
      ),
    );
  }
}
