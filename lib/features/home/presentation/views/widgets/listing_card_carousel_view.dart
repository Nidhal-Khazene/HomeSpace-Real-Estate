import 'package:flutter/material.dart';
import 'package:home_space/features/home/domain/entities/sale_listings_entity.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_view.dart';
import 'package:home_space/shared/functions/get_dummy_listing_card_details_images.dart';

class ListingCardCarouselView extends StatelessWidget {
  const ListingCardCarouselView({
    super.key,
    required CarouselController carouselController,
    required this.image,
    required this.saleListingsEntity,
  }) : _carouselController = carouselController;

  final CarouselController _carouselController;
  final String image;
  final SaleListingsEntity saleListingsEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: CarouselView(
        onTap: (index) {
          Navigator.pushNamed(
            context,
            ListingCardDetailsView.routeName,
            arguments: saleListingsEntity,
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        itemSnapping: true,
        controller: _carouselController,
        itemExtent: MediaQuery.sizeOf(context).width,
        children: List.generate(
          getDummyListingCardDetailsImages().length,
          (index) => Image(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
