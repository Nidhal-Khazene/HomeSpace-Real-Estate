import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_carousel_view_dots_indicator.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/whited_heart_oval_container.dart';
import 'package:home_space/shared/constants.dart';
import 'package:home_space/shared/functions/get_dummy_listing_card_details_images.dart';

import 'Listing_card_properties_row.dart';
import 'for_sale_container.dart';
import 'listing_card_carousel_view.dart';

class ListingCard extends StatefulWidget {
  const ListingCard({
    super.key,
    required this.image,
    required this.saleListingsEntity,
  });
  final String image;
  final SaleListingsEntity saleListingsEntity;

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  late CarouselController _carouselController;
  int currentIndex = 0;
  late double itemExtent;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _carouselController.animateTo(
        150,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    itemExtent = MediaQuery.sizeOf(context).width - kHorizontalPadding * 2;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ListingCardDetailsView.routeName,
          arguments: widget.saleListingsEntity,
        );
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
                saleListingsEntity: widget.saleListingsEntity,
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
                  listLength: getDummyListingCardDetailsImages().length,
                ),
              ),
              Positioned(
                top: 226,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${widget.saleListingsEntity.price.toString()}',
                      style: AppStyles.medium12.copyWith(
                        color: ColorsData.kMediumPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 17),
                    Text(
                      widget.saleListingsEntity.formattedAddress,
                      style: AppStyles.regular12,
                    ),
                    const SizedBox(height: 12),
                    ListingCardPropertiesRow(
                      saleListingsEntity: widget.saleListingsEntity,
                    ),
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
