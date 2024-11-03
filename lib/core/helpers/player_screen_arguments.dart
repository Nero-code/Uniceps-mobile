import 'package:uniceps/app/Auth/services/enitites/player.dart';

final class PlayerArguments {
  final bool hasData;
  final Player? data;

  PlayerArguments({
    required this.hasData,
    this.data,
  });
}
