import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/core/constants/cap_images.dart';

class SessionCompleteDialog extends StatelessWidget {
  const SessionCompleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.6,
          height: MediaQuery.sizeOf(context).width * 0.8,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              colors: [
                Colors.yellow,
                Colors.amber,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(5.0, 5.0),
                  color: Color.fromARGB(141, 158, 158, 158),
                  blurRadius: 3,
                ),
                BoxShadow(
                  offset: Offset(-5.0, -5.0),
                  color: Colors.white60,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                const Expanded(child: Image(image: AssetImage(CaptainImages.finishSession))),
                Center(
                  child: Text(
                    locale.welldone,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 69, 114, 126),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Color.fromARGB(255, 94, 147, 160),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white),
                    onPressed: () => Navigator.pop(context),
                    child: Text(locale.great),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
