import 'package:flutter/material.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';

///   Error widget without image or refresh
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.f,
  });

  final Failure f;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorToTextMapper(f)),
    );
  }
}
