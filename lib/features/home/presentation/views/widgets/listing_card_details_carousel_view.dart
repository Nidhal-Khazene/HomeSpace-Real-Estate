import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_carousel_view_dots_indicator.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_image_view.dart';

class ListingCardDetailsCarouselView extends StatefulWidget {
  const ListingCardDetailsCarouselView({super.key, required this.image});
  final String image;

  @override
  State<ListingCardDetailsCarouselView> createState() =>
      _ListingCardDetailsCarouselViewState();
}

class _ListingCardDetailsCarouselViewState
    extends State<ListingCardDetailsCarouselView> {
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
    return AspectRatio(
      aspectRatio:
          MediaQuery.sizeOf(context).height *
          0.38 /
          MediaQuery.sizeOf(context).width,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - kHorizontalPadding * 2,
        child: Stack(
          children: [
            CarouselView(
              onTap: (_) {
                Navigator.pushNamed(
                  context,
                  ListingCardDetailsImageView.routeName,
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              itemSnapping: true,
              controller: _carouselController,
              itemExtent: MediaQuery.sizeOf(context).width,
              children: List.generate(
                4,
                (index) => const Image(
                  image: AssetImage(Assets.assetsImagesListingCardDetails),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: ((MediaQuery.sizeOf(context).width - (24 * 2)) / 2) - 20,
              bottom: 24,
              child: ListingCardCarouselViewDotsIndicator(
                itemExtent: itemExtent,
                carouselController: _carouselController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
