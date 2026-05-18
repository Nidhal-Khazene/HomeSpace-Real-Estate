import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';

import '../../../../../core/utils/colors.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int _selectedIndex = 0;

  final List<String> categories = [
    "Apartment",
    "House",
    "Villa",
    "House",
    "Villa",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // fixed height for horizontal chips
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final bool isSelected = _selectedIndex == index;

          return ChoiceChip(
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
              color: isSelected ? Colors.white : ColorsData.kFontSecondaryColor,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isSelected
                    ? ColorsData.kMediumPrimaryColor
                    : ColorsData.kBorderColor,
              ),
              borderRadius: BorderRadius.circular(33),
            ),
          );
        },
      ),
    );
  }
}
