import 'package:intl/intl.dart';

String formatDate(DateTime? dateTime) {
  if (dateTime == null) return "Invalid date";
  return DateFormat("dd-MM-yyyy").format(dateTime);
}
