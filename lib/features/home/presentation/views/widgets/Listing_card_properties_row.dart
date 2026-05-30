import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'listing_card_property_with_value.dart';

class ListingCardPropertiesRow extends StatelessWidget {
  const ListingCardPropertiesRow({
    super.key,
    this.sizeProperty,
    this.saleListingsEntity,
  });
  final double? sizeProperty;
  final SaleListingsEntity? saleListingsEntity;

  @override
  Widget build(BuildContext context) {
    final bedrooms = saleListingsEntity?.bedrooms.toString() ?? "3";
    final bathrooms = saleListingsEntity?.bathrooms.toString() ?? "2";
    final squareFootage =
        saleListingsEntity?.squareFootage.toString() ?? "1200";

    return Row(
      children: [
        ListingCardPropertyWithValue(
          sizeProperty: sizeProperty,
          property: Assets.assetsImagesIconsBedRoomIcon,
          value: bedrooms,
        ),
        const SizedBox(width: 16),
        ListingCardPropertyWithValue(
          sizeProperty: sizeProperty,
          property: Assets.assetsImagesIconsBathRoomIcon,
          value: bathrooms,
        ),
        const SizedBox(width: 16),
        ListingCardPropertyWithValue(
          sizeProperty: sizeProperty,
          property: Assets.assetsImagesIconsCarIcon,
          value: "2",
        ),
        const SizedBox(width: 16),
        ListingCardPropertyWithValue(
          sizeProperty: sizeProperty,
          property: Assets.assetsImagesIconsTwoCardsIcon,
          value: "${squareFootage}sqt",
        ),
      ],
    );
  }
}
