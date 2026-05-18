import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/features/chats/presentation/views/widgets/chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});
  static const routeName = "ChatsView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(padding: kPrimaryScreenPadding, child: ChatsViewBody()),
      ),
    );
  }
}
