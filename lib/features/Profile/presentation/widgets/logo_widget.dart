import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.imageUrl, required this.size});

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return CachedNetworkImage(
      width: size,
      height: size,
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          const Image(image: AssetImage("images/logo/Logo-dark.png")),
    );
  }
}
