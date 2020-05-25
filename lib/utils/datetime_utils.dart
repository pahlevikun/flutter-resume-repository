import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String parseReverse(String _date) {
    initializeDateFormatting('id_ID', null);
    if (_date.isEmpty) {
      return "";
    } else {
      String fullDateTimeFormat = "yyyy-MM-dd";
      String originDateTimeFormat = "dd-MM-yyyyy";
      String result = new DateFormat(fullDateTimeFormat, "id_ID").format(
          DateTime.parse(
              DateFormat(originDateTimeFormat).parse(_date).toString()));
      return result;
    }
  }

  static String fullDateTimeHoursFormat(String _dateTime) {
    if (_dateTime.isEmpty) {
      return "";
    } else {
      String fullDateTimeFormat = "EEEE, dd MMM yyyy, hh:mm";
      String result =
          new DateFormat(fullDateTimeFormat).format(DateTime.parse(_dateTime));
      return result;
    }
  }

  static String dateTimeHoursFormat(String _dateTime) {
    if (_dateTime.isEmpty) {
      return "";
    } else {
      String fullDateTimeFormat = "dd MMM yyyy, hh:mm";
      String result =
          new DateFormat(fullDateTimeFormat).format(DateTime.parse(_dateTime));
      return result;
    }
  }

  static String fullDateTimeFormat(String _dateTime) {
    initializeDateFormatting('id_ID', null);
    if (_dateTime.isEmpty) {
      return "";
    } else {
      String fullDateTimeFormat = "EEEE, dd MMMM yyyy";
      String result = new DateFormat(fullDateTimeFormat, "id_ID")
          .format(DateTime.parse(_dateTime));
      return result;
    }
  }

  static String dateTimeYear(String _dateTime) {
    if (_dateTime.isEmpty) {
      return "";
    } else {
      String fullDateTimeFormat = "dd MMMM yyyy";
      String result =
          new DateFormat(fullDateTimeFormat).format(DateTime.parse(_dateTime));
      return result;
    }
  }

  static String fullDateFormat(String _dateTime) {
    initializeDateFormatting('id_ID', null);
    if (_dateTime.isEmpty) {
      return "";
    } else {
      String fullDateTimeFormat = "dd/MM/yyyy";
      String result = new DateFormat(fullDateTimeFormat, "id_ID")
          .format(DateTime.parse(_dateTime));
      return result;
    }
  }

  static String dayMonthFormat(String _dateTime) {
    if (_dateTime.isEmpty) {
      return "";
    } else {
      String fullDateTimeFormat = "EEEE, dd MMM";
      String result =
          new DateFormat(fullDateTimeFormat).format(DateTime.parse(_dateTime));
      return result;
    }
  }

  static String countAge(int year) {
    if (year == 0) {
      return "-";
    } else {
      final birthYear = DateTime(year);
      Duration duration = DateTime.now().difference(birthYear);
      final differenceInYears = (duration.inDays / 365).floor().toString();
      return "$differenceInYears Years old";
    }
  }
}
