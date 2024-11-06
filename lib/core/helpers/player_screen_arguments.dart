import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';

final class PlayerArguments {
  final bool hasData;
  final Player? data;

  PlayerArguments({
    required this.hasData,
    this.data,
  });
}
