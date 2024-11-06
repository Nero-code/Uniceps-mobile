import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';

class AttendenceModel extends Attendence {
  const AttendenceModel({
    required super.date,
    required super.loginTime,
    required super.logoutTime,
    required super.gymId,
    required super.pid,
    required super.sid,
  });

  factory AttendenceModel.fromJson(Map<dynamic, dynamic> json) {
    return AttendenceModel(
      date: DateTime.parse(json['date']),
      // date: stringToDate(json['date']),
      loginTime: DateTime.parse(json['login_time']),
      // json['login_time'],
      logoutTime: DateTime.parse(json['logout_time']),
      // json['logout_time'],
      gymId: json['gym_id'],
      pid: json['pid'],
      sid: json['sid'] ?? "",
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'login_time': loginTime.toIso8601String(),
      'logout_time': logoutTime.toIso8601String(),
      'gym_id': gymId,
      'pid': pid,
      'sid': sid,
    };
  }
}
