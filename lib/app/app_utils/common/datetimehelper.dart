import 'package:intl/intl.dart';


class DateTimeHelper {
  static String convertDateTimeToCustomFormatDate(DateTime dateTime) {
    DateFormat calendarFormat = DateFormat('dd-MM-yyyy');
    return calendarFormat.format(dateTime);
  }


  static String todays_date() {
  DateTime now = DateTime.now();
  final dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
   var today = dateFormat.format(now);
   return today;
  }

  static String todays_time() {
    DateTime now = DateTime.now();
    var timeFormat = DateFormat('kk:mm');
    var time = timeFormat.format(now);
    return time;
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 24 && now.day == date.day) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays == 1 || (difference.inHours < 48 && now.day != date.day)) {
      final time = DateFormat.jm().format(date);
      return 'Yesterday at $time';
    } else if (difference.inDays < 7) {
      final day = DateFormat.EEEE().format(date);
      final time = DateFormat.jm().format(date);
      return 'Last $day at $time';
    } else if (difference.inDays < 30) {
      final dayMonth = DateFormat.MMMd().format(date);
      final time = DateFormat.jm().format(date);
      return 'Last month on $dayMonth at $time';
    } else {
      return DateFormat.yMMMd().add_jm().format(date);
    }
  }

}
