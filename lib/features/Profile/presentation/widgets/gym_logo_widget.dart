import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

class GymLogoWidget extends StatelessWidget {
  const GymLogoWidget({super.key, required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: gym.isCurrent
                  ? Border.all(
                      width: 3.0,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : null,
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              width: 80,
              height: 80,
              imageUrl: "$API" "$HTTP_GYMS" "$HTTP_GYM_LOGO" "/${gym.id}",
              imageBuilder: (context, imageProvider) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image(image: imageProvider),
                );
              },
              errorWidget: (_, __, ___) => const Image(
                image: AssetImage(APP_LOGO_DARK),
              ),
              placeholder: (context, url) => const CircleAvatar(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            gym.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
