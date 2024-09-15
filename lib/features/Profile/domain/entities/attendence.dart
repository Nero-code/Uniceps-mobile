import 'package:uniceps/core/constants/constants.dart';

// var a = [
//   {
//     "aid": 5,
//     "date": "07/09/2024",
//     "gym_id": "66bdd431f93dffa35e2a1a21",
//     "id": "66dd6feef23e070d4b57d532",
//     "login_time": "08:15",
//     "logout_time": "23:15",
//     "pid": "9",
//     "sid": ""
//   },
//   {
//     "aid": 6,
//     "date": "07/09/2024",
//     "gym_id": "66bdd431f93dffa35e2a1a21",
//     "id": "66dd6ffff23e070d4b57d533",
//     "login_time": "30:15",
//     "logout_time": "30:15",
//     "pid": "9",
//     "sid": ""
//   },
//   {
//     "aid": 9,
//     "date": "08/09/2024",
//     "gym_id": "66bdd431f93dffa35e2a1a21",
//     "id": "66dd7001f23e070d4b57d536",
//     "login_time": "01:11",
//     "logout_time": "01:11",
//     "pid": "9",
//     "sid": ""
//   }
// ];

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

  factory Attendence.fromJson(Map<String, dynamic> json) => Attendence(
        date: stringToDate(json['date']),
        loginTime: json['login_time'],
        logoutTime: json['logout_time'],
        gymId: json['gym_id'],
        pid: json['pid'],
        sid: json['sid'] ?? "",
      );

  Map<String, dynamic> toJson() {
    return {
      'date': dateToString(date),
      'login_time': loginTime,
      'logout_time': logoutTime,
      'gym_id': gymId,
      'pid': pid,
      'sid': sid,
    };
  }
}
