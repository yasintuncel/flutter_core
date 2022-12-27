class DateHelper {
  static String toLocalString(String date) {
    return DateTime.parse(date).toLocal().toString().substring(0, 16);
  }

  static String toLocalStringFromDate(DateTime date) {
    return date.toLocal().toString().substring(0, 16);
  }

  static String toLocalStringJustDate(String date) {
    return DateTime.parse(date).toLocal().toString().substring(0, 10);
  }

  static String toLocalStringFromDateJustDate(DateTime date) {
    return date.toLocal().toString().substring(0, 10);
  }
}
