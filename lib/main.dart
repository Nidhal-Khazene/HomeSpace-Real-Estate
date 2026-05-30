import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_space/Features/auth/presentation/views/widgets/turn_on_notification_view.dart';
import 'package:home_space/core/services/bloc_observer.dart';
import 'package:home_space/core/services/service_locator.dart';
import 'package:home_space/core/services/setup_hive.dart';
import 'package:home_space/features/splash/presentation/views/splash_view.dart';
import 'package:home_space/shared/constants.dart';
import 'package:home_space/core/routing/on_generate_route.dart';
import 'package:home_space/core/services/shared_preferences_singleton.dart';
import 'package:home_space/core/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  serviceLocator();
  await SharedPreferencesSingleton.init();
  Bloc.observer = SimpleBlocObserver();
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
      initialRoute: TurnOnNotification.routeName,
    );
  }
}
