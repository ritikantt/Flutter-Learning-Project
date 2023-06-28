import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class Expense {
  Expense(this.title, this.amount, this.date);

  final String title;
  final int amount;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
