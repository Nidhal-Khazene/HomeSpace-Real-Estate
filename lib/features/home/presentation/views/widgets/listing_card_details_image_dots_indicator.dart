import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';

class ListingCardDetailsImageDotsIndicator extends StatefulWidget {
  const ListingCardDetailsImageDotsIndicator({
    super.key,
    required this.carouselController,
    required this.itemExtent,
    required this.listLength,
  });
  final CarouselController carouselController;
  final double itemExtent;
  final int listLength;
  @override
  State<ListingCardDetailsImageDotsIndicator> createState() =>
      _ListingCardDetailsImageDotsIndicatorState();
}

class _ListingCardDetailsImageDotsIndicatorState
    extends State<ListingCardDetailsImageDotsIndicator> {
  int currentIndex = 0;
  double totalWidth = 100;
  double dynamicWidth = 20;
  late double factorWidth;
  @override
  void initState() {
    super.initState();
    factorWidth = totalWidth / widget.listLength;
    dynamicWidth = ((currentIndex + 1) * factorWidth);
    widget.carouselController.addListener(() {
      final double position = widget.carouselController.offset;
      final int newIndex = (position / widget.itemExtent).round();
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
          factorWidth = totalWidth / widget.listLength;
          dynamicWidth = ((currentIndex + 1) * factorWidth);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: totalWidth,
      height: 4,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: totalWidth,
              height: 4,
              decoration: ShapeDecoration(
                color: ColorsData.kLightPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: dynamicWidth,
              height: 4,
              decoration: ShapeDecoration(
                color: ColorsData.kMediumPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
