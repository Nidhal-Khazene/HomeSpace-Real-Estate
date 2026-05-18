import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';

import '../../../../../core/utils/colors.dart';

class SelectTimeChoiceChipListView extends StatefulWidget {
  const SelectTimeChoiceChipListView({super.key});

  @override
  State<SelectTimeChoiceChipListView> createState() =>
      _SelectTimeChoiceChipListViewState();
}

class _SelectTimeChoiceChipListViewState
    extends State<SelectTimeChoiceChipListView> {
  int _selectedIndex = 0;

  final List<String> categories = [
    "11:00AM",
    "1:00PM",
    "3:00PM",
    "5:00AM",
    "15:00PM",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // fixed height for horizontal chips
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final bool isSelected = _selectedIndex == index;

          return ChoiceChip(
            padding: const EdgeInsets.symmetric(
              vertical: 10.5,
              horizontal: 42.5,
            ),
            pressElevation: 0,
            elevation: 0,
            showCheckmark: false,
            label: Text(categories[index]),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: Colors.transparent,
            selectedColor: ColorsData.kMediumPrimaryColor,
            labelStyle: AppStyles.regular12.copyWith(
              color: isSelected ? Colors.white : ColorsData.kMediumPrimaryColor,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorsData.kMediumPrimaryColor),
              borderRadius: BorderRadius.circular(33),
            ),
          );
        },
      ),
    );
  }
}
