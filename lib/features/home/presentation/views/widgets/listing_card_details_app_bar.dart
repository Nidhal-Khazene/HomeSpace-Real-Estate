import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_go_back_button.dart';
import '../../../../../core/widgets/custom_oval_container.dart';

class ListingCardDetailsAppBar extends StatefulWidget {
  const ListingCardDetailsAppBar({super.key});

  @override
  State<ListingCardDetailsAppBar> createState() =>
      _ListingCardDetailsAppBarState();
}

class _ListingCardDetailsAppBarState extends State<ListingCardDetailsAppBar> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomGoBackButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        CustomOvalContainer(
          onTap: () {
            setState(() {
              isLoved = !isLoved;
            });
            if (isLoved) {
              showSnackBar(context, message: "Saved to Favourites");
            }
          },
          height: 40,
          width: 40,
          backgroundColor: Colors.transparent,
          borderColor: ColorsData.kBorderColor,
          widget: isLoved
              ? const Icon(Iconsax.heart, color: Colors.red)
              : SvgPicture.asset(
                  Assets.assetsImagesIconsHeartBlackOutlinedIcon,
                ),
        ),
      ],
    );
  }
}
