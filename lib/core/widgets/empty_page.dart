import 'package:flutter/widgets.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key, required this.imageName, required this.message, this.imageSize = const Size(100, 100)});

  final String imageName, message;
  final Size imageSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(imageName),
          width: imageSize.width,
          height: imageSize.height,
        ),
        const SizedBox(height: 10),
        Text(message, textAlign: TextAlign.center),
      ],
    );
  }
}
