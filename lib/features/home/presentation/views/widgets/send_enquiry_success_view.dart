import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:home_space/core/widgets/custom_button.dart';

class SendEnquirySuccessView extends StatelessWidget {
  const SendEnquirySuccessView({super.key});

  static const routeName = "sendEnquirySuccessView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            children: [
              const SizedBox(height: 278),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 59 - 24),
                child: Column(
                  children: [
                    SvgPicture.asset(Assets.assetsImagesIconsSuccessButton),
                    const SizedBox(height: 24),
                    Text(
                      "Your enquiry has been sent ",
                      textAlign: TextAlign.center,
                      style: AppStyles.medium24,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 238),
              CustomButton(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    CustomBottomNavigationBar.routeName,
                  );
                },
                textContent: "Return To Home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
