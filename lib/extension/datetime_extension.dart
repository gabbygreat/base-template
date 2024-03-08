extension DateTimeExtension on DateTime {
  String timeCalculator() {
    DateTime now = DateTime.now();
    if (now.difference(this).inDays > 0) {
      if (now.difference(this).inDays > 30) {
        return '${(now.difference(this).inDays / 30).truncate()} ${(now.difference(this).inDays / 30).truncate() > 1 ? 'months ago' : 'month ago'}';
      } else {
        return '${now.difference(this).inDays.toString()} day${now.difference(this).inDays > 1 ? 's' : ''} ago';
      }
    } else if (now.difference(this).inHours > 0 &&
        now.difference(this).inHours < 24) {
      return '${now.difference(this).inHours.toString()} hour${now.difference(this).inHours > 1 ? 's' : ''} ago';
    } else if (now.difference(this).inMinutes > 0 &&
        now.difference(this).inMinutes < 60) {
      return '${now.difference(this).inMinutes.toString()} minute${now.difference(this).inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'now';
    }
  }
}
