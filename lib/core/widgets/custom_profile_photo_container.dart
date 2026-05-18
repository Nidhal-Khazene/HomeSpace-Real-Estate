import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomProfilePhotoContainer extends StatelessWidget {
  const CustomProfilePhotoContainer({super.key, required this.profilePhoto});
  final String profilePhoto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 61,
      height: 67,
      child: Stack(
        children: [
          SizedBox(
            width: 61,
            height: 61,
            child: CircleAvatar(child: Image.asset(profilePhoto)),
          ),
          Positioned(
            bottom: 1,
            right: 2,
            child: Container(
              width: 24,
              height: 24,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: ColorsData.kMediumPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Icon(Iconsax.camera_copy, size: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
