import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ListingCardDetailsCustomBottomSheetListTile extends StatelessWidget {
  const ListingCardDetailsCustomBottomSheetListTile({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorsData.kBorderColor, width: 1),
      ),
      leading: Icon(
        Iconsax.calendar_1_copy,
        color: ColorsData.kMediumPrimaryColor,
        size: 20,
      ),
      title: Text(title, style: AppStyles.regular16),
      trailing: GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.arrow_forward_ios,
          color: ColorsData.kFontPrimaryColor,
          size: 24,
        ),
      ),
    );
  }
}
