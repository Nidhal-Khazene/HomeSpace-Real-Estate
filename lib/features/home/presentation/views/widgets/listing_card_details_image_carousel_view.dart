import 'package:flutter/material.dart';
import 'package:home_space/shared/constants.dart';

class ListingCardDetailsImageCarouselView extends StatelessWidget {
  const ListingCardDetailsImageCarouselView({
    super.key,
    required this.images,
    required this.carouselController,
  });
  final List<String> images;
  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              itemSnapping: true,
              controller: carouselController,
              itemExtent: MediaQuery.sizeOf(context).width,
              children: List.generate(
                images.length,
                (index) =>
                    Image(image: AssetImage(images[index]), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
