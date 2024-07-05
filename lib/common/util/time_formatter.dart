class TimeFormatter {
  TimeFormatter._();

  static String formatToDot(String utcDateTimeString) {
    DateTime dateTime = DateTime.parse(utcDateTimeString);

    String year = (dateTime.year % 100).toString();
    String month = dateTime.month.toString().padLeft(2, "0");
    String day = dateTime.day.toString().padLeft(2, "0");

    return "$year. $month. $day";
  }

  static String calDiffer(String createdAt) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(DateTime.parse(createdAt));

    if (difference.inDays >= 30) {
      // 한 달 이상 차이가 나는 경우 원래 시간을 문자열로 반환
      return DateTime.parse(createdAt).toString();
    } else if (difference.inDays > 0) {
      // 하루 이상 차이가 나는 경우 일 단위로 반환
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      // 하루 이하 차이가 나는 경우 시간 단위로 반환
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      // 한 시간 이하 차이가 나는 경우 분 단위로 반환
      return '${difference.inMinutes}분 전';
    } else {
      // 1분 이하 차이가 나는 경우 초 단위로 반환
      return '${difference.inSeconds}초 전';
    }
  }

  static String durationFormatter(int milliSeconds) {
    var seconds = milliSeconds ~/ 1000;
    final hours = seconds ~/ 3600;
    seconds = seconds % 3600;
    var minutes = seconds ~/ 60;
    seconds = seconds % 60;
    final hoursString = hours >= 10
        ? '$hours'
        : hours == 0
            ? '00'
            : '0$hours';
    final minutesString = minutes >= 10
        ? '$minutes'
        : minutes == 0
            ? '00'
            : '0$minutes';
    final secondsString = seconds >= 10
        ? '$seconds'
        : seconds == 0
            ? '00'
            : '0$seconds';
    final formattedTime =
        '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';
    return formattedTime;
  }
}
