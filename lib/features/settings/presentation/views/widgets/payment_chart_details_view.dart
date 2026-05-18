import 'package:flutter/material.dart';
import 'package:home_space/core/models/payment_item_model.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/features/settings/presentation/views/widgets/payment_chart_item.dart';

class PaymentChartDetailsView extends StatelessWidget {
  const PaymentChartDetailsView({super.key});

  static final List<PaymentItemModel> list = [
    PaymentItemModel(
      color: PieChartColorsData.systemPurple,
      title: "Principal & interest",
      price: 500,
    ),
    PaymentItemModel(
      color: PieChartColorsData.systemBlackRed,
      title: "Property tax",
      price: 280,
    ),
    PaymentItemModel(
      color: PieChartColorsData.systemGreen,
      title: "Homeowner’s Insurance",
      price: 66,
    ),
    PaymentItemModel(
      color: PieChartColorsData.systemYellow,
      title: "PMI",
      price: 55,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          spacing: 24,
          children: List.generate(
            list.length,
            (index) => PaymentChartItem(
              color: list[index].color,
              title: list[index].title,
              price: list[index].price,
            ),
          ),
        ),
        const SizedBox(height: 33),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total monthly payment", style: AppStyles.regular12),
            Text("\$896", style: AppStyles.bold16),
          ],
        ),
      ],
    );
  }
}
