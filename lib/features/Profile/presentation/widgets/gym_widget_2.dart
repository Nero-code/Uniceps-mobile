import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

class GymWidget2 extends StatelessWidget {
  const GymWidget2({
    super.key,
    required this.gym,
    required this.onPressed,
    required this.icon,
  });

  final Gym gym;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapUp: (details) => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width * 0.15,
              imageUrl: "$API" "$HTTP_GYMS" "$HTTP_GYM_LOGO" "/${gym.id}",
              placeholder: (context, url) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: const Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => const Icon(
                Icons.fitness_center,
                size: 50,
                color: Colors.grey,
              ),
            ),
            Text(gym.name),
            icon,
          ],
        ),
      ),
    );
  }
}
