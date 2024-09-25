// import 'package:intl/intl.dart';
import 'package:uniceps/core/constants/constants.dart';

class Attendence {
  final DateTime date;
  final String loginTime, logoutTime, gymId, pid, sid;

  const Attendence({
    required this.date,
    required this.loginTime,
    required this.logoutTime,
    required this.gymId,
    required this.pid,
    required this.sid,
  });

  factory Attendence.fromJson(Map<dynamic, dynamic> json) {
    print("date:        ${json['date']}");
    print("date:        ${json['date'].runtimeType}");
    print("loginTime:   ${json['login_time'].runtimeType}");
    print("logoutTime:  ${json['logout_time'].runtimeType}");
    print("gymId:       ${json['gym_id'].runtimeType}");
    print("pid:         ${json['pid'].runtimeType}");
    print("sid:         ${json['sid'] ?? ""}");

    return Attendence(
      // date: DateFormat("EEE, dd MMM yyyy hh:mm:ss").parse(json['date']),
      date: stringToDate(json['date']),
      loginTime:
          // DateFormat("EEE, dd MMM yyyy hh:mm:ss").parse(json['login_time']),
          json['login_time'],
      logoutTime:
          // DateFormat("EEE, dd MMM yyyy hh:mm:ss").parse(json['logout_time']),
          json['logout_time'],
      gymId: json['gym_id'],
      pid: json['pid'],
      sid: json['sid'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'date': DateFormat("EEE, dd MMM yyyy hh:mm:ss").format(date),
      // 'login_time': DateFormat("EEE, dd MMM yyyy hh:mm:ss").format(loginTime),
      // 'logout_time': DateFormat("EEE, dd MMM yyyy hh:mm:ss").format(logoutTime),
      'date': dateToString(date),
      'login_time': loginTime,
      'logout_time': logoutTime,
      'gym_id': gymId,
      'pid': pid,
      'sid': sid,
    };
  }
}
