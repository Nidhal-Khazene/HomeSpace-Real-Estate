import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_space/core/services/setup_hive.dart';
import 'package:home_space/shared/constants.dart';
import 'package:home_space/core/routing/on_generate_route.dart';
import 'package:home_space/core/services/shared_preferences_singleton.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/shared/widgets/custom_bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await SharedPreferencesSingleton.init();

  await setupHive();
  runApp(const HomeSpace());
}

class HomeSpace extends StatelessWidget {
  const HomeSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: kPrimaryFont,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: ColorsData.kFontPrimaryColor),
          bodyMedium: TextStyle(color: ColorsData.kFontPrimaryColor),
          bodySmall: TextStyle(color: ColorsData.kFontPrimaryColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: CustomBottomNavigationBar.routeName,
    );
  }
}
