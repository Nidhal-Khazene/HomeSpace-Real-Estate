import 'package:flutter/material.dart';

class ListingCardDetailsImageDotsIndicator extends StatefulWidget {
  const ListingCardDetailsImageDotsIndicator({
    super.key,
    required this.carouselController,
    required this.itemExtent,
  });
  final CarouselController carouselController;
  final double itemExtent;
  @override
  State<ListingCardDetailsImageDotsIndicator> createState() =>
      _ListingCardDetailsImageDotsIndicatorState();
}

class _ListingCardDetailsImageDotsIndicatorState
    extends State<ListingCardDetailsImageDotsIndicator> {
  int listLength = 4;
  int currentIndex = 0;
  double totalWidth = 100;
  double dynamicWidth = 20;
  late double factorWidth;
  @override
  void initState() {
    widget.carouselController.addListener(() {
      final double position = widget.carouselController.offset;
      final int newIndex = (position / widget.itemExtent).round();
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
          factorWidth = totalWidth / listLength;
          dynamicWidth = ((currentIndex + 1) * factorWidth);
        });
      }
    });
    super.initState();
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
                color: const Color(0xFFE8ECFF) /* Primary-Red-10 */,
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
                color: const Color(0xFF4360F6) /* Primary-Red-100 */,
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
