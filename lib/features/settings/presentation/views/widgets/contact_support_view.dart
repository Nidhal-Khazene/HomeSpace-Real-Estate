import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/functions/build_list_tile_border.dart';
import 'package:home_space/core/models/list_tile_model.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_app_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ContactSupportView extends StatelessWidget {
  const ContactSupportView({super.key});

  static const routeName = "ContactSupportView";
  static final List<ListTileModel> list = [
    ListTileModel(
      title: "Call Us",
      trailingWidget: const Icon(
        Iconsax.call_copy,
        color: Colors.white,
        size: 20,
      ),
    ),
    ListTileModel(
      title: "Email Us",
      trailingWidget: const Icon(
        Iconsax.message_minus_copy,
        color: Colors.white,
        size: 20,
      ),
    ),
    ListTileModel(
      title: "Live Chat",
      trailingWidget: const Icon(
        Iconsax.message_notif_copy,
        color: Colors.white,
        size: 20,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            children: [
              CustomAppBar(
                title: "Contact Support",
                textStyle: AppStyles.bold16,
              ),
              const SizedBox(height: 40),
              Column(
                spacing: 12,
                children: List.generate(
                  list.length,
                  (index) => ListTile(
                    shape: buildListTileRoundedRectangleBorder(),
                    title: Text(list[index].title!, style: AppStyles.regular16),
                    trailing: CircleAvatar(
                      backgroundColor: ColorsData.kMediumPrimaryColor,
                      child: list[index].trailingWidget,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
