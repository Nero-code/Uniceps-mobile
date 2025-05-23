import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.gymId, required this.size});

  final String gymId;
  final double size;

  @override
  Widget build(BuildContext context) {
    // print(gymId);
    return CachedNetworkImage(
      width: size,
      height: size,
      imageUrl: "$API" "$HTTP_GYMS" "$HTTP_GYM_LOGO" "/$gymId",
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child:
            ColoredBox(color: Colors.amber, child: Image(image: imageProvider)),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          // const Image(image: AssetImage("images/logo/Logo-dark.png")),
          Icon(
        Icons.fitness_center,
        size: size,
        color: Colors.grey.shade400,
      ),
    );
  }
}
