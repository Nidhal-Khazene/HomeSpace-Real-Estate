import 'package:flutter/material.dart';
import 'package:home_space/features/chats/presentation/views/widgets/listing_enquiry_message.dart';
import 'package:home_space/features/chats/presentation/views/widgets/normal_message.dart';

class MessagesSection extends StatelessWidget {
  const MessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16, top: 32),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: ListingEnquiryMessage()),
            Align(alignment: Alignment.topRight, child: NormalMessage()),
          ],
        ),
      ),
    );
  }
}
