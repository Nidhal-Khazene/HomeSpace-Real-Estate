import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_go_back_button.dart';
import 'package:home_space/core/widgets/custom_text_field.dart';
import 'package:home_space/features/auth/presentation/views/widgets/password_reset_link_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  static const String routeName = "ResetPasswordView";

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool readyToContinue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomGoBackButton(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PasswordResetLinkView.routeName,
                  );
                },
              ),
              const SizedBox(height: 35),
              Text("Reset Password", style: AppStyles.medium32),
              const SizedBox(height: 33),
              CustomTextField(
                onChanged: (data) {
                  if (data!.isNotEmpty) {
                    setState(() {
                      readyToContinue = true;
                    });
                  } else {
                    setState(() {
                      readyToContinue = false;
                    });
                  }
                },
                textContent: "Enter Email Address",
              ),
              const SizedBox(height: 12),
              CustomButton(
                onTap: readyToContinue
                    ? () {
                        Navigator.pushReplacementNamed(
                          context,
                          PasswordResetLinkView.routeName,
                        );
                      }
                    : null,
                textContent: "Continue",
                borderColor: readyToContinue
                    ? ColorsData.kPrimaryColor
                    : Colors.transparent,
                backgroundColor: readyToContinue
                    ? ColorsData.kPrimaryColor
                    : ColorsData.kNotReadyButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
