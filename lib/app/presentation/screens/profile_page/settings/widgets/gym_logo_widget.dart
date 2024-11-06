import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';

class GymLogoWidget extends StatelessWidget {
  const GymLogoWidget({super.key, required this.gym, required this.onPressed});

  final Gym gym;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: gym.isCurrent
                  ? Border.all(
                      width: 5.0,
                      // color: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : null,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              child: InkWell(
                onTap: onPressed,
                splashColor: Colors.white,
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  width: 80,
                  height: 80,
                  imageUrl: "$API" "$HTTP_GYMS" "$HTTP_GYM_LOGO" "/${gym.id}",
                  imageBuilder: (context, imageProvider) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(image: imageProvider),
                    );
                  },
                  errorWidget: (_, __, ___) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(APP_LOGO_DARK),
                    ),
                  ),
                  placeholder: (context, url) => Material(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            gym.name,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
