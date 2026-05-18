import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_circle_container.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/custom_property_type_container.dart';

class WhatIsYourBuildingPreferenceView extends StatefulWidget {
  const WhatIsYourBuildingPreferenceView({super.key});

  @override
  State<WhatIsYourBuildingPreferenceView> createState() =>
      _WhatIsYourBuildingPreferenceViewState();
}

class _WhatIsYourBuildingPreferenceViewState
    extends State<WhatIsYourBuildingPreferenceView> {
  final List<String> propertiesList = ["Apartment", "House", "Villa", "House"];
  int bedsCounter = 0;
  int bathsCounter = 0;
  int currentPropertyTypeContainerPosition = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What's your building preference ?", style: AppStyles.medium24),
          const SizedBox(height: 32),
          Text("Property type", style: AppStyles.regular16),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: propertiesList.asMap().entries.map((entry) {
                int index = entry.key;
                var e = entry.value;

                bool isActive = currentPropertyTypeContainerPosition == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPropertyTypeContainerPosition = index;
                    });
                  },
                  child: CustomPropertyTypeContainer(
                    textContent: e,
                    textContentColor: isActive
                        ? Colors.white
                        : ColorsData.kFontSecondaryColor,
                    backgroundColor: isActive
                        ? ColorsData.kMediumPrimaryColor
                        : Colors.transparent,
                    borderColor: isActive
                        ? ColorsData.kMediumPrimaryColor
                        : ColorsData.kBorderColor,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 21,
                horizontal: 10,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SvgPicture.asset(
                  Assets.assetsImagesIconsArrowDown,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              hintText: "Property Status",
              hintStyle: AppStyles.regular14.copyWith(
                color: ColorsData.kFontPrimaryColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorsData.kBorderColor,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          //Beds Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Beds", style: AppStyles.medium16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (bedsCounter > 0) {
                          bedsCounter = bedsCounter - 1;
                        }
                      });
                    },
                    child: CustomCircleContainer(
                      widget: SvgPicture.asset(Assets.assetsImagesIconsMinus),
                      backgroundColor: ColorsData.kMediumPrimaryColor,
                      borderColor: ColorsData.kMediumPrimaryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CustomCircleContainer(
                    textContent: "$bedsCounter",
                    backgroundColor: Colors.transparent,
                    borderColor: ColorsData.kBorderColor,
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bedsCounter = bedsCounter + 1;
                      });
                    },
                    child: CustomCircleContainer(
                      widget: SvgPicture.asset(Assets.assetsImagesIconsAdd),
                      backgroundColor: ColorsData.kMediumPrimaryColor,
                      borderColor: ColorsData.kMediumPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          //Baths Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Baths", style: AppStyles.medium16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (bathsCounter > 0) {
                          bathsCounter = bathsCounter - 1;
                        }
                      });
                    },
                    child: CustomCircleContainer(
                      widget: SvgPicture.asset(Assets.assetsImagesIconsMinus),
                      backgroundColor: ColorsData.kMediumPrimaryColor,
                      borderColor: ColorsData.kMediumPrimaryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CustomCircleContainer(
                    textContent: "$bathsCounter",
                    backgroundColor: Colors.transparent,
                    borderColor: ColorsData.kBorderColor,
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bathsCounter = bathsCounter + 1;
                      });
                    },
                    child: CustomCircleContainer(
                      widget: SvgPicture.asset(Assets.assetsImagesIconsAdd),
                      backgroundColor: ColorsData.kMediumPrimaryColor,
                      borderColor: ColorsData.kMediumPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
