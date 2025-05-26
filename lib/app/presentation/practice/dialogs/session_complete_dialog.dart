import 'package:flutter/material.dart';

class SessionCompleteDialog extends StatelessWidget {
  const SessionCompleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.75,
          height: MediaQuery.sizeOf(context).height * 0.5,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.workspace_premium_rounded,
                    size: 150,
                    // color: Color.fromARGB(255, 94, 147, 160),
                    color: Colors.amber,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Well Done!!!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 69, 114, 126),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Color.fromARGB(255, 94, 147, 160),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Great!"),
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
