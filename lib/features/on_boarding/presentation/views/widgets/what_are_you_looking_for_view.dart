import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_oval_container.dart';

class WhatAreYouLookingForView extends StatefulWidget {
  const WhatAreYouLookingForView({super.key});

  @override
  State<WhatAreYouLookingForView> createState() =>
      _WhatAreYouLookingForViewState();
}

class _WhatAreYouLookingForViewState extends State<WhatAreYouLookingForView> {
  List<String> optionsList = ["Buy", "Rent"];
  int currentPosition = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("What are you looking for ?", style: AppStyles.medium24),
        const SizedBox(height: 12),
        Text(
          "We’ll start with these listings, you can change them later.",
          style: AppStyles.regular12.copyWith(
            color: ColorsData.kFontSecondaryColor,
          ),
        ),
        const SizedBox(height: 51),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 55 - kHorizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: optionsList.asMap().entries.map((entries) {
              int index = entries.key;
              var e = entries.value;
              bool isActive = currentPosition == index;
              return CustomOvalContainer(
                onTap: () {
                  setState(() {
                    currentPosition = index;
                  });
                },
                textContent: e,
                textContentColor: !isActive
                    ? ColorsData.kMediumPrimaryColor
                    : null,
                backgroundColor: !isActive ? Colors.transparent : null,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
