import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_search_bar.dart';
import '../../../../../core/widgets/search_bottom_sheet_view.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          state = !state;
        });

        await showModalBottomSheet(
          backgroundColor: Colors.white,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          context: context,
          builder: (context) => SearchBottomSheetView(
            state: state,
            textContent: "Search Address, City or Postal code",
          ),
        );

        if (mounted) {
          setState(() {
            state = !state;
          });
        }
      },
      child: CustomSearchBar(
        state: state,
        textContent: "Search Address, City or Postal code",
      ),
    );
  }
}
