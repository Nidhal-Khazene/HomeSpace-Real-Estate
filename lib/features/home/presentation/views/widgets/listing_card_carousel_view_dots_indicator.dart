import 'package:flutter/material.dart';
import 'package:home_space/shared/constants.dart';

class ListingCardCarouselViewDotsIndicator extends StatefulWidget {
  const ListingCardCarouselViewDotsIndicator({
    super.key,
    required this.carouselController,
    required this.itemExtent,
    required this.listLength,
  });

  final CarouselController carouselController;
  final double itemExtent;
  final int listLength;

  @override
  State<ListingCardCarouselViewDotsIndicator> createState() =>
      _ListingCardCarouselViewDotsIndicatorState();
}

class _ListingCardCarouselViewDotsIndicatorState
    extends State<ListingCardCarouselViewDotsIndicator> {
  int currentIndex = 0;
  @override
  void initState() {
    widget.carouselController.addListener(() {
      final double position = widget.carouselController.offset;
      final int newIndex = (position / widget.itemExtent).round();
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: List.generate(
        widget.listLength,
        (index) => AnimatedContainer(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: kMillisecondsDuration),
          child: Container(
            width: 4,
            height: 4,
            decoration: ShapeDecoration(
              color: currentIndex == index ? Colors.transparent : Colors.white,
              shape: const OvalBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
