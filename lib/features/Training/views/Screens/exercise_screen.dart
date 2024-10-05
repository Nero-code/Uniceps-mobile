import 'package:flutter/material.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_widget.dart';

@Deprecated("Exercises now show in listview in homePage")
class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final List<int> items = [0, 1, 2, 3, 4, 5];

  final List<int> doneItems = [];

  int currentPage = 0;

  final _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Uniceps",
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // body: ListView.separated(
      //   padding: EdgeInsets.symmetric(vertical: 10),
      //   itemCount: items.length + doneItems.length,
      //   itemBuilder: (context, index) {
      //     if (doneItems.length > index) {
      //       return ExerciseWidget(isDone: true);
      //     } else if (doneItems.length == index) {
      //       return const SizedBox(
      //         height: 20,
      //         child: Row(
      //           children: [
      //             Expanded(child: Divider()),
      //             Icon(
      //               Icons.check_circle_rounded,
      //               color: Colors.green,
      //             ),
      //             Expanded(child: Divider()),
      //           ],
      //         ),
      //       );
      //     } else if (items.isNotEmpty) {
      //       return Dismissible(
      //         key: ValueKey(items[index - doneItems.length]),
      //         background: Container(
      //           alignment: Alignment.centerLeft,
      //           padding: EdgeInsets.only(left: 15),
      //           color: Colors.amber,
      //           child: const Icon(Icons.done),
      //         ),
      //         secondaryBackground: Container(
      //           alignment: Alignment.centerRight,
      //           padding: EdgeInsets.only(right: 15),
      //           color: Colors.amber,
      //           child: Icon(Icons.done),
      //         ),
      //         direction: DismissDirection.horizontal,
      //         onDismissed: (direction) {
      //           print(index);
      //           print(items);
      //           print('\n');
      //           setState(() {
      //             items.removeAt(index - doneItems.length);
      //             doneItems.add(index);
      //           });
      //         },
      //         child: ExerciseWidget(isDone: false),
      //       );
      //     }
      //     return const SizedBox();
      //   },
      //   separatorBuilder: (context, index) {
      //     return SizedBox(
      //       height: 10,
      //     );
      //   },
      // ),
      body: Stack(
        children: [
          SizedBox(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ExerciseWidget();
              },
            ),
          ),
          Positioned(
            bottom: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: currentPage > 0
                      ? () {
                          _controller.animateToPage(--currentPage,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOutExpo);
                          setState(() {});
                        }
                      : null,
                  icon: Icon(
                    Icons.arrow_circle_left,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: currentPage == items[0]
                      ? Icon(Icons.done_rounded, color: Colors.green)
                      : Icon(Icons.done_outline_rounded),
                ),
                IconButton(
                  onPressed: currentPage < items.length - 1
                      ? () {
                          _controller.animateToPage(++currentPage,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOutExpo);
                          setState(() {});
                        }
                      : null,
                  icon: Icon(
                    Icons.arrow_circle_right_sharp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
