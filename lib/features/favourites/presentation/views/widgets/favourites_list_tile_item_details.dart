import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/functions/show_snack_bar.dart';
import 'package:home_space/core/models/listing_card_model.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/features/favourites/presentation/views/widgets/favourites_listing_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavouritesListTileItemDetails extends StatefulWidget {
  const FavouritesListTileItemDetails({super.key});

  static const String routeName = "FavouritesListTileItemDetails";

  @override
  State<FavouritesListTileItemDetails> createState() =>
      _FavouritesListTileItemDetailsState();
}

class _FavouritesListTileItemDetailsState
    extends State<FavouritesListTileItemDetails> {
  List<ListingCardModel> listingCardList = [
    ListingCardModel(
      title: "2715 Ash Dr. San Jose, South Dakota 83475",
      image: Assets.assetsImagesListTileImagesImage1,
      price: 650,
    ),
    ListingCardModel(
      title: "2118 Thornridge Cir. Syracuse, Connecticut 35624",
      image: Assets.assetsImagesListTileImagesImage2,
      price: 450,
    ),
    ListingCardModel(
      title: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
      image: Assets.assetsImagesListTileImagesImage3,
      price: 850,
    ),
    ListingCardModel(
      title: "3891 Ranchview Dr. Richardson, California 62639",
      image: Assets.assetsImagesListTileImagesImage4,
      price: 700,
    ),
    ListingCardModel(
      title: "8502 Preston Rd. Inglewood, Maine 98380",
      image: Assets.assetsImagesListTileImagesImage5,
      price: 420,
    ),
    ListingCardModel(
      title: "6391 Elgin St. Celina, Delaware 10299",
      image: Assets.assetsImagesListTileImagesImage6,
      price: 470,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  title: "Apartment in Uk",
                  textStyle: AppStyles.medium16,
                  widthFromBackButton: 68,
                ),
                const SizedBox(height: 24),
                Column(
                  spacing: 12,
                  children: List.generate(
                    listingCardList.length,
                    (index) => Dismissible(
                      background: Container(
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEE3455),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Iconsax.trash_copy, color: Colors.white),
                            SizedBox(width: 12),
                          ],
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          listingCardList.removeAt(index);
                          showSnackBar(context, message: "Listing was deleted");
                        });
                      },
                      key: ValueKey(listingCardList[index].title),
                      child: FavouritesListingCard(
                        title: listingCardList[index].title!,
                        image: listingCardList[index].image!,
                        price: listingCardList[index].price!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
