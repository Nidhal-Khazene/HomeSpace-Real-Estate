import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/models/list_tile_model.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_text_field.dart';
import 'package:home_space/features/favourites/presentation/views/widgets/favourites_list_tile_item.dart';
import 'package:home_space/features/favourites/presentation/views/widgets/favourites_list_tile_item_details.dart';
import 'package:home_space/features/favourites/presentation/views/widgets/no_listing_on_your_whishlist_yet.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  static final List<ListTileModel> list = [
    ListTileModel(title: "Apartment in Uk", subtitle: "10 Locations"),
    ListTileModel(title: "Rental in Florida", subtitle: "5 Locations"),
    ListTileModel(title: "New listings", subtitle: "24 Locations"),
    ListTileModel(title: "Apartment in Chicago", subtitle: "10 Locations"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPrimaryScreenPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your List", style: AppStyles.medium16),
              GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: '',
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, __, ___) {
                      return Center(
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width:
                                MediaQuery.sizeOf(context).width -
                                kHorizontalPadding * 2,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Create New List",
                                      style: AppStyles.bold16,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.assetsImagesIconsX,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                const CustomTextField(
                                  textContent: "Placeholder",
                                ),
                                const SizedBox(height: 32),
                                CustomButton(
                                  textContent: "Create",
                                  backgroundColor:
                                      ColorsData.kMediumPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    transitionBuilder: (_, anim, __, child) {
                      return Transform.scale(
                        scale: anim.value,
                        child: Opacity(opacity: anim.value, child: child),
                      );
                    },
                  );
                },
                child: Text(
                  "New List",
                  style: AppStyles.medium16.copyWith(
                    color: ColorsData.kMediumPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            spacing: 12,
            children: List.generate(
              4,
              (index) => FavouritesListTileItem(
                onTap: () {
                  if (index == 0) {
                    Navigator.pushNamed(
                      context,
                      FavouritesListTileItemDetails.routeName,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      NoListingOnYourWishlistYet.routeName,
                    );
                  }
                },
                title: list[index].title!,
                subtitle: list[index].subtitle!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
