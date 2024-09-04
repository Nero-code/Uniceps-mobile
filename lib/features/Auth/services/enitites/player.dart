import 'package:equatable/equatable.dart';
import 'package:uniceps/core/constants/constants.dart';

class Player extends Equatable {
  final String name, phoneNum, birthDate, uid;
  final String? gymUrl;
  final Gender gender;

  const Player({
    required this.name,
    required this.uid,
    required this.phoneNum,
    required this.birthDate,
    required this.gender,
    this.gymUrl,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'full_name': name,
        'phone': phoneNum,
        'birth_date': birthDate,
        'gender_male': gender == Gender.male ? "True" : "False",
        // 'gymUrl': gymUrl,
      };

  @override
  List<Object?> get props => [name, phoneNum, birthDate, gender];
}
