import 'package:intl/intl.dart';

String formatDate(DateTime? dateTime) {
  if (dateTime == null) return "Invalid date";
  return DateFormat("dd-MM-yyyy").format(dateTime);
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }
}
