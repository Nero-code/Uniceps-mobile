class Attendence {
  final DateTime date, loginTime, logoutTime;
  final String gymId, pid, sid;

  const Attendence({
    required this.date,
    required this.loginTime,
    required this.logoutTime,
    required this.gymId,
    required this.pid,
    required this.sid,
  });

  factory Attendence.fromJson(Map<dynamic, dynamic> json) {
    return Attendence(
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
