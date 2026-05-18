import 'package:flutter/material.dart';
import 'package:home_space/core/utils/styles.dart';

class PaymentChartItem extends StatelessWidget {
  const PaymentChartItem({
    super.key,
    required this.color,
    required this.title,
    required this.price,
  });

  final Color color;
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: ShapeDecoration(
            color: color /* System-Purple */,
            shape: const OvalBorder(),
          ),
        ),
        SizedBox(width: 12),
        Text(title, style: AppStyles.regular12),
        Expanded(child: SizedBox()),
        Text('\$$price', style: AppStyles.regular12),
      ],
    );
  }
}
