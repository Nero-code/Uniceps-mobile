import 'package:equatable/equatable.dart';

/// The General Gym Model
class Gym extends Equatable {
  /// `id`: primary key for class.
  ///
  /// `pid`: Player id in gym.
  /// ___
  ///
  /// those are meta-data
  /// for the gym in question:
  ///
  /// `address`, `logo`, `ownerName`, `phoneNum`, `telephone`,`name`

  final String name, id, pid, address, logo, ownerName, phoneNum, telephone;

  /// `start`: is the date that the player started in the gym.
  ///
  /// `end`: is the date of the last subscription for player.
  ///
  /// `joinedAt`: **Do Not Use**!! should've been the date when the player
  /// joined the gym but it seems like needless Redundancy and should be
  /// deprecated in future releases.
  final DateTime? start, end, joinedAt;

  /// * `isSelected`: a flag used to **identify** the gyms that the user joined to
  /// seperate them from the rest of the gyms *Naming problem*
  ///
  /// * `isCurrent`: a flag used to **REALLY** select a gym and show it's active
  /// training program.
  /// ___
  /// those two flags should be replaced by a different approach, beacause their
  /// main purpose is two seperate [currently-selected] from [joined-in-general]
  /// from [normal gyms].
  ///
  /// > all we need from this model is the [pid] to fetch the training routine
  final bool isSelected, isCurrent;

  const Gym({
    required this.id,
    required this.pid,
    required this.name,
    required this.address,
    required this.logo,
    required this.ownerName,
    required this.phoneNum,
    required this.telephone,
    required this.joinedAt,
    required this.start,
    required this.end,
    this.isSelected = false,
    this.isCurrent = false,
  });

  @override
  List<Object?> get props => [id];
}
