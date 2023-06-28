import 'package:flutter/material.dart';
import 'package:income_expense_assignment/screens/expense_screen.dart';
import 'package:income_expense_assignment/screens/income_screen.dart';
import 'package:income_expense_assignment/screens/user_dashboard.dart';

import '../data/expense_dummy.dart';
import '../models/expense.dart';

final List<Expense> _expensesList = expenseDummy;

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const UserDashboardScreen();
    var activePageTitle = 'User Dashboard';

    if (_selectedPageIndex == 1) {
      activePage = const IncomeScreen();
      activePageTitle = 'Your Income';
    }

    if (_selectedPageIndex == 2) {
      activePage = const ExpenseScreen();
      activePageTitle = 'Your Expenses';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Income',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Expense',
            ),
          ]),
    );
  }
}
