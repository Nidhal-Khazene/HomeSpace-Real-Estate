import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_search_bar.dart';

import 'bottom_sheet_line_header.dart';

class SearchBottomSheetView extends StatefulWidget {
  const SearchBottomSheetView({
    super.key,
    required this.textContent,
    required this.state,
  });

  final String textContent;
  final bool state;

  @override
  State<SearchBottomSheetView> createState() => _SearchBottomSheetViewState();
}

class _SearchBottomSheetViewState extends State<SearchBottomSheetView> {
  List<String> locationsList = [
    "4140 Parker Rd. Allentown, New Mexico 31134",
    "3517 W. Gray St. Utica, Pennsylvania 57867",
    "3891 Ranchview Dr. Richardson, California 62639",
    "2464 Royal Ln. Mesa, New Jersey 45463",
    "8502 Preston Rd. Inglewood, Maine 98380",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 46,
        child: Column(
          children: [
            const SizedBox(height: 8),
            const BottomSheetLineHeader(),
            const SizedBox(height: 52),
            CustomSearchBar(
              state: widget.state,
              textContent: widget.textContent,
            ),
            const SizedBox(height: 24),
            Column(
              children: locationsList.map((e) {
                return ListTile(
                  leading: SvgPicture.asset(
                    Assets.assetsImagesIconsLocationIcon,
                    height: 20,
                    width: 20,
                  ),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(e, style: AppStyles.regular12),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
