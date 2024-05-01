import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({super.key, this.isDone = false});
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: MediaQuery.of(context).size.height * 0.2,
    //   decoration: BoxDecoration(
    //     color: isDone
    //         ? Theme.of(context).colorScheme.onPrimary
    //         : const Color.fromARGB(255, 230, 230, 230),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         flex: 1,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text("Training Name"),
    //             Text("15 * 12 * 10"),
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //         flex: 1,
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: Colors.grey,
    //           ),
    //           child: Center(child: Text("Image")),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image(
                image: AssetImage('images/muscle-groups/Leg.png'),
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                        "Description: Play this exercise with cables and dumbells laying on the floor of the gym with no more than 50 Kg of weight on top of you..."),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text("Weight (Kg)"),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text("Add"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Last Weight: 10 Kg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
