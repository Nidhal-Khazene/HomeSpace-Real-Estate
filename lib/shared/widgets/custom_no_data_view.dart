import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_space/core/utils/assets.dart';

class CustomNoDataView extends StatelessWidget {
  const CustomNoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(Assets.assetsImagesIconsNoData));
  }
}
