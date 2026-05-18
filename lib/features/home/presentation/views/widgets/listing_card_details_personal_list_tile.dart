import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_oval_container.dart';

class ListingCardDetailsPersonalListTile extends StatelessWidget {
  const ListingCardDetailsPersonalListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorsData.kBorderColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      leading: const CircleAvatar(
        backgroundImage: AssetImage(Assets.assetsImagesPersonalImage2),
      ),
      title: Text("Robert daniel", style: AppStyles.regular16),
      trailing: CustomOvalContainer(
        borderColor: Colors.transparent,
        backgroundColor: ColorsData.kMediumPrimaryColor,
        width: 40,
        height: 40,
        widget: const Icon(Iconsax.call_copy, color: Colors.white, size: 20),
      ),
    );
  }
}
