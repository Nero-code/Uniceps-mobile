import 'package:flutter/material.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

class GymWidget2 extends StatelessWidget {
  const GymWidget2({super.key, required this.gym, required this.onPressed});

  final Gym gym;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapUp: (details) => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage("images/logo/Logo.png"),
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(gym.name),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
