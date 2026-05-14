import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RestTimerDialog extends StatefulWidget {
  const RestTimerDialog({super.key});

  @override
  State<RestTimerDialog> createState() => _RestTimerDialogState();
}

class _RestTimerDialogState extends State<RestTimerDialog> with TickerProviderStateMixin {
  late AnimationController _controller;
  Duration _duration = const Duration(seconds: 30);
  bool _isStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isStarted = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_duration.inSeconds == 0) return;
    setState(() {
      _isStarted = true;
    });
    _controller.duration = _duration;
    _controller.reverse(from: 1.0);
  }

  void _resetTimer() {
    _controller.stop();
    setState(() {
      _isStarted = false;
      _controller.value = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      icon: Icon(Icons.timer, color: theme.colorScheme.primary, size: 50),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          if (!_isStarted)
            SizedBox(
              height: 150,
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.ms,
                initialTimerDuration: _duration,
                onTimerDurationChanged: (newDuration) {
                  setState(() {
                    _duration = newDuration;
                  });
                },
              ),
            )
          else
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CircularProgressIndicator(
                        value: _controller.value,
                        strokeWidth: 10,
                        strokeCap: .round,
                        backgroundColor: theme.colorScheme.secondary.withValues(alpha: 0.1),
                        valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                      );
                    },
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final remaining = (_controller.value * _duration.inSeconds).ceil();
                    final minutes = remaining ~/ 60;
                    final seconds = remaining % 60;
                    return Text(
                      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w200,
                        color: theme.colorScheme.onSurface,
                      ),
                    );
                  },
                ),
              ],
            ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(padding: .zero),
                  onPressed: _isStarted ? _resetTimer : () => Navigator.pop(context),
                  child: Text(_isStarted ? locale.reset : locale.cancel),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: ElevatedButton(
                  onPressed: _isStarted ? () => Navigator.pop(context) : _startTimer,
                  child: Text(_isStarted ? locale.finish : locale.start),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
