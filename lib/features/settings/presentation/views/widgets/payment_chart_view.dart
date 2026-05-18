import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class PaymentChartView extends StatefulWidget {
  const PaymentChartView({super.key});

  @override
  State<PaymentChartView> createState() => _PaymentChartViewState();
}

class _PaymentChartViewState extends State<PaymentChartView> {
  int currentSectionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: PieChart(getPieChartData())),
          Text("\$896", style: AppStyles.bold14),
        ],
      ),
    );
  }

  PieChartData getPieChartData() {
    return PieChartData(
      pieTouchData: getPieTouchData(),
      sectionsSpace: 0,
      sections: [
        PieChartSectionData(
          value: 500,
          showTitle: false,
          color: PieChartColorsData.systemPurple,
          radius: currentSectionIndex == 0
              ? kTouchedRadiusChart
              : kNormalRadiusChart,
        ),
        PieChartSectionData(
          value: 280,
          showTitle: false,
          color: PieChartColorsData.systemBlackRed,
          radius: currentSectionIndex == 1
              ? kTouchedRadiusChart
              : kNormalRadiusChart,
        ),
        PieChartSectionData(
          value: 66,
          showTitle: false,
          color: PieChartColorsData.systemGreen,
          radius: currentSectionIndex == 2
              ? kTouchedRadiusChart
              : kNormalRadiusChart,
        ),
        PieChartSectionData(
          value: 50,
          showTitle: false,
          color: PieChartColorsData.systemYellow,
          radius: currentSectionIndex == 3
              ? kTouchedRadiusChart
              : kNormalRadiusChart,
        ),
      ],
    );
  }

  PieTouchData getPieTouchData() {
    return PieTouchData(
      enabled: true,
      touchCallback:
          (FlTouchEvent flTouchEvent, PieTouchResponse? pieTouchResponse) {
            setState(() {
              currentSectionIndex =
                  pieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1;
            });
          },
    );
  }
}
