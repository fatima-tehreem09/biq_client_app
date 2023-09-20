import 'package:intl/intl.dart';

extension MonthFormat on DateTime {
  String get dateMonthFormat => DateFormat('MMM dd, yyyy').format(this);
  String get dateSlashFormat => DateFormat('MM/dd/yyyy').format(this);
}
