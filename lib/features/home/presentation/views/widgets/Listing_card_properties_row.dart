import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'listing_card_property_with_value.dart';

class ListingCardPropertiesRow extends StatelessWidget {
  const ListingCardPropertiesRow({super.key, this.sizeProperty});
  final double? sizeProperty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListingCardPropertyWithValue(
          sizeProperty: sizeProperty,
          property: Assets.assetsImagesIconsBedRoomIcon,
          value: "3",
        ),
        const SizedBox(width: 16),
        ListingCardPropertyWithValue(
          sizeProperty: sizeProperty,
          property: Assets.assetsImagesIconsBathRoomIcon,
          value: "2",
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
          value: "1200sqt",
        ),
      ],
    );
  }
}
