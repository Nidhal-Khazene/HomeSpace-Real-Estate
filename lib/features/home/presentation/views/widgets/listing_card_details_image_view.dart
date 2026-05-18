import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_image_carousel_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_image_dots_indicator.dart';

import 'listing_card_details_image_header.dart';

class ListingCardDetailsImageView extends StatefulWidget {
  const ListingCardDetailsImageView({super.key, required this.image});

  final String image;

  static const routeName = "ListingCardDetailsImageView";

  @override
  State<ListingCardDetailsImageView> createState() =>
      _ListingCardDetailsImageViewState();
}

class _ListingCardDetailsImageViewState
    extends State<ListingCardDetailsImageView> {
  late CarouselController _carouselController;
  late double itemExtent;

  @override
  void initState() {
    _carouselController = CarouselController();
    _carouselController.animateTo(
      150,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemExtent = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorsData.kFontPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            children: [
              ListingCardDetailsImageHeader(
                carouselController: _carouselController,
                itemExtent: itemExtent,
              ),
              const SizedBox(height: 130),
              ListingCardDetailsImageCarouselView(
                carouselController: _carouselController,
                image: Assets.assetsImagesListingCardDetails,
              ),
              const SizedBox(height: 151),
              ListingCardDetailsImageDotsIndicator(
                carouselController: _carouselController,
                itemExtent: itemExtent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
