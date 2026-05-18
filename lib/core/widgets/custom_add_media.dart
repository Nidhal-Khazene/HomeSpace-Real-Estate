import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../utils/colors.dart';
import 'custom_oval_container.dart';

class CustomAddMedia extends StatelessWidget {
  const CustomAddMedia({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 40,
      duration: const Duration(microseconds: 100),
      curve: Curves.easeIn,
      child: isActive ? const ActiveAddingMedia() : const NoActiveAddingMedia(),
    );
  }
}

class ActiveAddingMedia extends StatelessWidget {
  const ActiveAddingMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136,
      child: Column(
        children: [
          CustomOvalContainer(
            height: 40,
            width: 40,
            widget: Icon(
              Iconsax.video_add_copy,
              color: ColorsData.kMediumPrimaryColor,
              size: 20,
            ),
            borderColor: ColorsData.kMediumPrimaryColor,
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 8),
          CustomOvalContainer(
            height: 40,
            width: 40,
            widget: Icon(
              Iconsax.image_copy,
              color: ColorsData.kMediumPrimaryColor,
              size: 20,
            ),
            borderColor: ColorsData.kMediumPrimaryColor,
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 8),
          CustomOvalContainer(
            height: 40,
            width: 40,
            widget: const Icon(Iconsax.add_copy, color: Colors.white, size: 20),
            borderColor: ColorsData.kMediumPrimaryColor,
            backgroundColor: ColorsData.kMediumPrimaryColor,
          ),
        ],
      ),
    );
  }
}

class NoActiveAddingMedia extends StatelessWidget {
  const NoActiveAddingMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOvalContainer(
      height: 40,
      width: 40,
      widget: Icon(Icons.add, color: ColorsData.kMediumPrimaryColor, size: 20),
      borderColor: ColorsData.kBorderColor,
      backgroundColor: Colors.transparent,
    );
  }
}
