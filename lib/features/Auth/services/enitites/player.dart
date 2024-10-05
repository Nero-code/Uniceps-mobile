import 'package:equatable/equatable.dart';
import 'package:uniceps/core/constants/constants.dart';

class Player extends Equatable {
  final String name, phoneNum, birthDate, uid, email;
  final Gender gender;
  final double level;

  const Player({
    required this.name,
    required this.uid,
    required this.phoneNum,
    required this.birthDate,
    required this.gender,
    required this.level,
    required this.email,
  });

  // Map<String, dynamic> toJson() => {
  //       'uid': uid,
  //       'full_name': name,
  //       'phone': phoneNum,
  //       'birth_date': birthDate,
  //       'gender_male': gender == Gender.male ? "True" : "False",
  //       // 'gymUrl': gymUrl,
  //     };

  @override
  List<Object?> get props => [uid, name, phoneNum, birthDate, gender.name];
}
