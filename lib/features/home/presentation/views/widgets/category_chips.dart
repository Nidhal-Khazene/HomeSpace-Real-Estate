import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/shared/functions/get_category_titles.dart';

import '../../../../../core/utils/colors.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({
    super.key,
    required this.onTap,
    this.selectedCategory = 'All',
  });

  final void Function(int selectedIndex) onTap;
  final String selectedCategory;

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  late int _selectedIndex;
  final List<String> categories = getCategoryTitles();

  @override
  void initState() {
    super.initState();
    _selectedIndex = categories.indexOf(widget.selectedCategory);
    if (_selectedIndex == -1) _selectedIndex = 0;
  }

  @override
  void didUpdateWidget(covariant CategoryChips oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategory != widget.selectedCategory) {
      final index = categories.indexOf(widget.selectedCategory);
      if (index != -1 && index != _selectedIndex) {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final bool isSelected = _selectedIndex == index;

          return ChoiceChip(
            pressElevation: 0,
            elevation: 0,
            showCheckmark: false,
            label: Text(categories[index]),
            selected: isSelected,
            onSelected: (_) {
              if (_selectedIndex != index) {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onTap(index);
              }
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
