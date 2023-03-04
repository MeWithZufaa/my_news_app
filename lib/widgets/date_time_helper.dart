import 'package:intl/intl.dart';

class DateTimeHelper {
  static String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
    DateTime date = DateTime.parse(dateString);
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if (difference.inSeconds < 5) {
      return 'just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${numericDates ? "hrs" : "hours"} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${numericDates ? "days" : "days"} ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} ${numericDates ? "weeks" : "weeks"} ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} ${numericDates ? "months" : "months"} ago';
    } else {
      return '${(difference.inDays / 365).floor()} ${numericDates ? "years" : "years"} ago';
    }
  }

  static String formatDateTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat.yMMMMEEEEd().format(dateTime);
  }
}
