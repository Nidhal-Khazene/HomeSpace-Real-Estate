import 'package:flutter/material.dart';
import 'package:home_space/features/home/presentation/views/widgets/more_actions_bottom_sheet.dart';
import 'package:home_space/features/home/presentation/views/widgets/send_enquiry_view.dart';

import '../../../../../shared/constants.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../shared/widgets/custom_button.dart';
import '../../../../../shared/widgets/custom_circle_container.dart';
import '../../../../../shared/widgets/custom_three_dots.dart';

class ListingCardDetailsCustomBottomBar extends StatelessWidget {
  const ListingCardDetailsCustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 80,
      decoration: BoxDecoration(
        color: ColorsData.kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: ColorsData.kShadowColor,
            blurRadius: 12,
            offset: const Offset(5, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, SendEnquiryView.routeName);
                },
                verticalPadding: 0,
                height: 38,
                width: 117,
                textContent: "Send enquiry",
                textStyle: AppStyles.regular12.copyWith(color: ColorsData.kWhiteColor),
                backgroundColor: ColorsData.kMediumPrimaryColor,
              ),
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    backgroundColor: ColorsData.kWhiteColor,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    context: context,
                    builder: (context) => const MoreActionsBottomSheet(),
                  );
                },
                child: CustomCircleContainer(
                  backgroundColor: ColorsData.kTransparentColor,
                  borderColor: ColorsData.kBorderColor,
                  widget: const CustomThreeDots(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
