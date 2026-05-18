import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_go_back_button.dart';
import 'package:home_space/core/widgets/custom_text_field.dart';
import 'package:home_space/features/auth/presentation/views/widgets/login_or_sign_up_password.dart';
import 'package:home_space/features/auth/presentation/views/widgets/turn_on_notification_view.dart';

class FinishSignUpViewBody extends StatefulWidget {
  const FinishSignUpViewBody({super.key});

  @override
  State<FinishSignUpViewBody> createState() => _FinishSignUpViewBodyState();
}

class _FinishSignUpViewBodyState extends State<FinishSignUpViewBody> {
  bool readyToContinue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPrimaryScreenPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomGoBackButton(
              onTap: () {
                Navigator.popAndPushNamed(
                  context,
                  LoginOrSignUpPassword.routeName,
                );
              },
            ),
            const SizedBox(height: 35),
            Text("Finish Signup", style: AppStyles.medium32),
            const SizedBox(height: 32),
            CustomTextField(
              textContent: "Firstname",
              onChanged: (data) => onChangedLogic(data, "first"),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              textContent: "Lastname",
              onChanged: (data) => onChangedLogic(data, "last"),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              textContent: "Katrinabennet21@gmail.com",
              textContentColor: ColorsData.kFontPrimaryColor,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              textContent: "Password",
              onChanged: (data) => onChangedLogic(data, "password"),
            ),
            const SizedBox(height: 12),
            Text("Must be 8 characters", style: AppStyles.regular12),
            const SizedBox(height: 32),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "By selecting agree and Continue, you accept our ",
                    style: AppStyles.regular14,
                  ),
                  TextSpan(
                    text: "terms and condition",
                    style: AppStyles.regular14.copyWith(
                      color: const Color(0xFF4360F6),
                    ),
                  ),
                  const TextSpan(text: "."),
                ],
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              borderColor: readyToContinue
                  ? ColorsData.kPrimaryColor
                  : Colors.transparent,
              textContent: "Agree and Continue",
              backgroundColor: readyToContinue
                  ? ColorsData.kPrimaryColor
                  : ColorsData.kNotReadyButtonColor,
              onTap: readyToContinue
                  ? () {
                      Navigator.pushNamed(
                        context,
                        TurnOnNotification.routeName,
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  String firstName = '';
  String lastName = '';
  String password = '';

  void onChangedLogic(String? data, String fieldKey) {
    if (fieldKey == 'first') firstName = data ?? '';
    if (fieldKey == 'last') lastName = data ?? '';
    if (fieldKey == 'password') password = data ?? '';

    setState(() {
      readyToContinue =
          firstName.isNotEmpty && lastName.isNotEmpty && password.isNotEmpty;
    });
  }
}
