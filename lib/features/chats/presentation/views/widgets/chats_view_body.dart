import 'package:flutter/material.dart';
import 'package:home_space/core/functions/build_list_tile_border.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_circle_container.dart';
import 'package:home_space/features/chats/presentation/views/widgets/chat_room_view.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  static final List<Image> imagesList = [
    Image.asset(Assets.assetsImagesPersonalAccount),
    Image.asset(Assets.assetsImagesPersonalImage2),
    Image.asset(Assets.assetsImagesPersonalImage3),
    Image.asset(Assets.assetsImagesPersonalImage4),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text("Chats", style: AppStyles.bold16),
          const SizedBox(height: 16),
          Column(
            spacing: 12,
            children: List.generate(
              imagesList.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ChatRoomView.routeName,
                    arguments: imagesList[index].image,
                  );
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  minTileHeight: 32,
                  isThreeLine: true,
                  shape: buildListTileRoundedRectangleBorder(),
                  leading: CustomCircleContainer(
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    widget: imagesList[index],
                  ),
                  title: Text("Robert daniel", style: AppStyles.regular12),
                  subtitle: Text(
                    'I will send you more listings for you to check out..how about that ?',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.regular12.copyWith(
                      color: ColorsData.kFontSecondaryColor,
                    ),
                  ),
                  trailing: Text(
                    "10:24AM",
                    style: AppStyles.regular12.copyWith(
                      color: ColorsData.kMediumPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
