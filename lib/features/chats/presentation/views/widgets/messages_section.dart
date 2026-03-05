import 'package:flutter/material.dart';
import 'package:home_space/features/chats/presentation/views/widgets/normal_message.dart';

class MessagesSection extends StatelessWidget {
  const MessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [NormalMessage()],
        ),
      ),
    );
  }
}
