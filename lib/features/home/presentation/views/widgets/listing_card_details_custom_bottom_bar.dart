import 'package:flutter/material.dart';
import 'package:home_space/features/home/presentation/views/widgets/more_actions_bottom_sheet.dart';
import 'package:home_space/features/home/presentation/views/widgets/send_enquiry_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circle_container.dart';
import '../../../../../core/widgets/custom_three_dots.dart';

class ListingCardDetailsCustomBottomBar extends StatelessWidget {
  const ListingCardDetailsCustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 12,
            offset: Offset(5, 0),
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
                textStyle: AppStyles.regular12.copyWith(color: Colors.white),
                backgroundColor: ColorsData.kMediumPrimaryColor,
              ),
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    context: context,
                    builder: (context) => const MoreActionsBottomSheet(),
                  );
                },
                child: CustomCircleContainer(
                  backgroundColor: Colors.transparent,
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
