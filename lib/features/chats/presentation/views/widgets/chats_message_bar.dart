import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_add_media.dart';
import 'package:home_space/core/widgets/custom_text_field.dart';

class ChatsMessageBar extends StatefulWidget {
  const ChatsMessageBar({super.key});

  @override
  State<ChatsMessageBar> createState() => _ChatsMessageBarState();
}

class _ChatsMessageBarState extends State<ChatsMessageBar> {
  bool isAddingMediaActive = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: CustomTextField(
                  hintStyle: AppStyles.regular12.copyWith(
                    color: ColorsData.kFontSecondaryColor,
                  ),
                  textContent: "Write Message",
                  borderRadiusValue: 100,
                ),
              ),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                setState(() {
                  isAddingMediaActive = !isAddingMediaActive;
                });
              },
              child: CustomAddMedia(isActive: isAddingMediaActive),
            ),
          ],
        ),
        const SizedBox(height: 61),
      ],
    );
  }
}
