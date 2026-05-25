import 'package:flutter/material.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';

class ListingEnquiryMessage extends StatelessWidget {
  const ListingEnquiryMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F4FC) /* Bg2 */,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 224,
            child: Text(
              'listing enquiry',
              style: AppStyles.medium12.copyWith(
                color: ColorsData.kMediumPrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: ColorsData.kBorderColor),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Image.asset(Assets.assetsImagesImage2ListTile),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 174,
                      child: Text(
                        '4519 Washington Ave. Manchester, Kentucky 39494',
                        style: AppStyles.regular12.copyWith(
                          color: ColorsData.kFontPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 224,
            child: Text(
              'Hi, Robert am interested in getting more info for this listing, i think it works fine for me, I also need more listing suggestions Thank you.',
              style: AppStyles.regular12.copyWith(
                color: ColorsData.kFontPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
