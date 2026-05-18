import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/bottom_sheet_line_header.dart';
import 'package:home_space/features/home/presentation/views/widgets/schedule_tour_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/share_listing_view.dart';

import 'listing_card_details_bottom_sheet_list_tile.dart';

class MoreActionsBottomSheet extends StatelessWidget {
  const MoreActionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: kPrimaryScreenPadding,
        child: Column(
          children: [
            const SizedBox(height: 12),
            const BottomSheetLineHeader(),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("More Actions", style: AppStyles.medium16),
            ),
            const SizedBox(height: 24),
            ListingCardDetailsCustomBottomSheetListTile(
              onTap: () {
                Navigator.pushNamed(context, ScheduleTourView.routeName);
              },
              title: "Schedule tour",
            ),
            const SizedBox(height: 12),
            ListingCardDetailsCustomBottomSheetListTile(
              onTap: () {
                Navigator.pushNamed(context, ShareListingView.routeName);
              },
              title: "Share listing",
            ),
          ],
        ),
      ),
    );
  }
}
