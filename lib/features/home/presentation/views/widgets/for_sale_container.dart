import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ForSaleContainer extends StatelessWidget {
  const ForSaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Text(
        "For Sale",
        style: AppStyles.medium10.copyWith(color: ColorsData.kPrimaryColor),
      ),
    );
  }
}
