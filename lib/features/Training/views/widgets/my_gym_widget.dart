import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/domain/classes/gym.dart';

class MyGymWidget extends StatelessWidget {
  const MyGymWidget({
    super.key,
    required this.myGym,
    required this.isSelected,
    required this.isCurrent,
    required this.onPressed,
  });

  final Gym myGym;
  final bool isSelected, isCurrent;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1,
        color: Colors.white,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected
                ? secondaryLight
                : isCurrent
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade200,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width * 0.15,
                  imageUrl: "$API" "$HTTP_GYMS" "$HTTP_GYM_LOGO" "/${myGym.id}",
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: imageProvider),
                  ),
                  errorWidget: (context, url, error) => Image(
                    image: const AssetImage(APP_LOGO_DARK),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(myGym.name),
                    Text(myGym.ownerName),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
