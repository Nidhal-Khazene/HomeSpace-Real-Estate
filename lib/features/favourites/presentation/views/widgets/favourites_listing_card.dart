import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/home/presentation/views/widgets/Listing_card_properties_row.dart';

import '../../../../../constants.dart';

class FavouritesListingCard extends StatelessWidget {
  const FavouritesListingCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });

  final String title, image;
  final int price;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width - kHorizontalPadding * 2;
    double height = MediaQuery.sizeOf(context).height * 0.12;
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE9E8E8)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Image.asset(image, height: height - 8),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.5 - 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$$price/Week",
                    style: AppStyles.medium12.copyWith(
                      color: ColorsData.kMediumPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 38,
                    width: 200,
                    child: Text(title, style: AppStyles.regular12),
                  ),
                  const SizedBox(height: 4),
                  const Expanded(
                    child: ListingCardPropertiesRow(sizeProperty: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
