import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_text_field.dart';
import 'package:home_space/features/settings/presentation/views/widgets/monthly_payment_breakdown_view.dart';

import '../../../../../core/utils/colors.dart';

class MortgageCalculatorForm extends StatefulWidget {
  const MortgageCalculatorForm({super.key});

  static const routeName = "MortgageCalculatorForm";

  @override
  State<MortgageCalculatorForm> createState() => _MortgageCalculatorFormState();
}

class _MortgageCalculatorFormState extends State<MortgageCalculatorForm> {
  bool readyToContinue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: "Mortgage Calculator"),
                const SizedBox(height: 16),
                CustomTextField(
                  textInputType: TextInputType.number,
                  textContent: "Home Price",
                  onChanged: (data) => onChangedLogic(data, 'homePrice'),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  textInputType: TextInputType.number,
                  textContent: "Down payment",
                  onChanged: (data) => onChangedLogic(data, 'downPayment'),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  textInputType: TextInputType.number,
                  textContent: "Loan term",
                  onChanged: (data) => onChangedLogic(data, 'loanTerm'),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  textInputType: TextInputType.number,
                  textContent: "Interest Rate",
                  onChanged: (data) => onChangedLogic(data, 'interestRate'),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  textInputType: TextInputType.number,
                  textContent: "Zip code",
                  onChanged: (data) => onChangedLogic(data, 'zipCode'),
                ),
                const SizedBox(height: 222),
                CustomButton(
                  borderColor: readyToContinue
                      ? ColorsData.kPrimaryColor
                      : Colors.transparent,
                  textContent: "Continue",
                  backgroundColor: readyToContinue
                      ? ColorsData.kPrimaryColor
                      : ColorsData.kNotReadyButtonColor,
                  onTap: readyToContinue
                      ? () {
                          Navigator.pushNamed(
                            context,
                            MonthlyPaymentBreakdownView.routeName,
                          );
                        }
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String homePrice = '';
  String downPayment = '';
  String loanTerm = '';
  String interestRate = '';
  String zipCode = '';

  void onChangedLogic(String? data, String fieldKey) {
    if (fieldKey == 'homePrice') homePrice = data ?? '';
    if (fieldKey == 'downPayment') downPayment = data ?? '';
    if (fieldKey == 'loanTerm') loanTerm = data ?? '';
    if (fieldKey == 'interestRate') interestRate = data ?? '';
    if (fieldKey == 'zipCode') zipCode = data ?? '';

    setState(() {
      readyToContinue =
          homePrice.isNotEmpty &&
          downPayment.isNotEmpty &&
          loanTerm.isNotEmpty &&
          interestRate.isNotEmpty &&
          zipCode.isNotEmpty;
    });
  }
}
