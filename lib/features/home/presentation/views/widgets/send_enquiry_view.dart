import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_text_field.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_personal_list_tile.dart';
import 'package:home_space/features/home/presentation/views/widgets/send_enquiry_success_view.dart';

class SendEnquiryView extends StatelessWidget {
  const SendEnquiryView({super.key});

  static const routeName = "sendEnquiry";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            children: [
              const CustomAppBar(title: "Send a Message"),
              const SizedBox(height: 32),
              const ListingCardDetailsPersonalListTile(),
              const SizedBox(height: 32),
              const CustomTextField(textContent: "Your Name"),
              const SizedBox(height: 8),
              const CustomTextField(textContent: "Your Message", maxLines: 7),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SendEnquirySuccessView.routeName,
                  );
                },
                child: const CustomButton(textContent: "Send Enquiry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
