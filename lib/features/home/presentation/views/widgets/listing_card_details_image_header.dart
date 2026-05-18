import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_go_back_button.dart';

class ListingCardDetailsImageHeader extends StatefulWidget {
  const ListingCardDetailsImageHeader({
    super.key,
    required this.carouselController,
    required this.itemExtent,
  });

  final CarouselController carouselController;
  final double itemExtent;

  @override
  State<ListingCardDetailsImageHeader> createState() =>
      _ListingCardDetailsImageHeaderState();
}

class _ListingCardDetailsImageHeaderState
    extends State<ListingCardDetailsImageHeader> {
  int listLength = 4;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomGoBackButton(
          widget: const Icon(Icons.close, color: Colors.white, size: 20),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width:
              ((MediaQuery.sizeOf(context).width - kHorizontalPadding) / 2) -
              24 * 2 -
              20,
        ),
        Text(
          "${currentIndex + 1}/$listLength",
          style: AppStyles.medium16.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
