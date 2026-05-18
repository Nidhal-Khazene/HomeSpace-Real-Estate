import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_carousel_view_dots_indicator.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/whited_heart_oval_container.dart';

import 'Listing_card_properties_row.dart';
import 'for_sale_container.dart';
import 'listing_card_carousel_view.dart';

class ListingCard extends StatefulWidget {
  const ListingCard({super.key, required this.image});
  final String image;

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  late CarouselController _carouselController;
  int currentIndex = 0;
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ListingCardDetailsView.routeName);
      },
      child: AspectRatio(
        aspectRatio:
            MediaQuery.sizeOf(context).height *
            0.50 /
            MediaQuery.sizeOf(context).width,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE9E8E8)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Stack(
            children: [
              ListingCardCarouselView(
                carouselController: _carouselController,
                image: widget.image,
              ),
              const Positioned(top: 12, left: 12, child: ForSaleContainer()),
              const Positioned(
                top: 12,
                right: 12,
                child: WhitedHeartOvalContainer(),
              ),
              Positioned(
                top: 195,
                left: ((MediaQuery.sizeOf(context).width - (24 * 2)) / 2) - 20,
                child: ListingCardCarouselViewDotsIndicator(
                  carouselController: _carouselController,
                  itemExtent: itemExtent,
                ),
              ),
              Positioned(
                top: 226,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r"$450/Week",
                      style: AppStyles.medium12.copyWith(
                        color: ColorsData.kMediumPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 17),
                    Text(
                      "4517 Washington Ave. Manchester, Kentucky 39495",
                      style: AppStyles.regular12,
                    ),
                    const SizedBox(height: 12),
                    const ListingCardPropertiesRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
