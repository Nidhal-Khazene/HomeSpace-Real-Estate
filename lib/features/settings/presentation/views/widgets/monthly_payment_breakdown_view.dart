import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/features/settings/presentation/views/widgets/payment_chart_details_view.dart';
import 'package:home_space/features/settings/presentation/views/widgets/payment_chart_view.dart';

class MonthlyPaymentBreakdownView extends StatelessWidget {
  const MonthlyPaymentBreakdownView({super.key});

  static const routeName = "MonthlyPaymentBreakdownView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: ""),
                const SizedBox(height: 53),
                Text("Monthy Payment Breakdown", style: AppStyles.bold16),
                const SizedBox(height: 40),
                const PaymentChartView(),
                const SizedBox(height: 35),
                Text("Total monthly payment", style: AppStyles.regular12),
                const SizedBox(height: 67),
                const PaymentChartDetailsView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
