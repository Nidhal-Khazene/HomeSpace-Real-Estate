import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/models/list_tile_model.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';

class HomeNotificationView extends StatelessWidget {
  const HomeNotificationView({super.key});

  static const routeName = "HomeNotificationView";
  static final List<ListTileModel> listTileList = [
    ListTileModel(
      leading: Assets.assetsImagesImage1ListTile,
      title: "New home for Sale",
      subtitle:
          "Discover your dream home! A stunning new property that matches your preferences just hit the market.",
    ),
    ListTileModel(
      leading: Assets.assetsImagesImage2ListTile,
      title: "Price Reduced",
      subtitle:
          "Attention homebuyers! We're excited to offer an exclusive discount sale on select properties.",
    ),
    ListTileModel(
      leading: Assets.assetsImagesDefaultImageListTile,
      title: "New Message",
      subtitle: "You've got a new message waiting for you!",
    ),
    ListTileModel(
      leading: Assets.assetsImagesDefaultImageListTile,
      title: "Your enquiry was sent",
      subtitle: "You've got a new message waiting for you!",
    ),
    ListTileModel(
      leading: Assets.assetsImagesDefaultImageListTile,
      title: "Your tour schedule has been confirmed",
      subtitle: "You've got a new message waiting for you!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: "Notifications",
                  textStyle: AppStyles.bold16,
                  widthFromBackButton: 82,
                ),
                const SizedBox(height: 32),
                Column(
                  spacing: 12,
                  children: List.generate(
                    5,
                    (index) => ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: ColorsData.kBorderColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      leading: Image.asset(listTileList[index].leading!),
                      title: Text(
                        listTileList[index].title!,
                        style: AppStyles.regular12,
                      ),
                      subtitle: Text(
                        listTileList[index].subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regular12.copyWith(
                          color: ColorsData.kFontSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
