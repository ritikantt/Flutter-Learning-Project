import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class Income {
  Income(this.title, this.amount, this.dividend, this.date);

  final String title;
  final int amount;
  final int dividend;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
