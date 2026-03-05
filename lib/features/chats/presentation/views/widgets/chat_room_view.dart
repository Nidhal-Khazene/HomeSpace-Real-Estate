import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:home_space/features/chats/presentation/views/widgets/chats_message_bar.dart';
import 'package:home_space/features/chats/presentation/views/widgets/messages_section.dart';

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({super.key});

  static const routeName = "ChatRoomView";

  @override
  Widget build(BuildContext context) {
    final profileImage =
        ModalRoute.of(context)!.settings.arguments as AssetImage;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(
                title: "Robert daniel",
                textStyle: AppStyles.medium16,
                profileImageWidget: Image(image: profileImage),
              ),
              const MessagesSection(),
              const ChatsMessageBar(),
            ],
          ),
        ),
      ),
    );
  }
}
