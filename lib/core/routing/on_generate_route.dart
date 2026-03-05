import 'package:flutter/material.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:home_space/features/auth/presentation/views/finish_sign_up_view.dart';
import 'package:home_space/features/auth/presentation/views/login_view.dart';
import 'package:home_space/features/auth/presentation/views/widgets/login_or_sign_up_password.dart';
import 'package:home_space/features/auth/presentation/views/widgets/password_reset_link_view.dart';
import 'package:home_space/features/auth/presentation/views/widgets/reset_password_view.dart';
import 'package:home_space/features/auth/presentation/views/widgets/turn_on_notification_view.dart';
import 'package:home_space/features/chats/presentation/views/chats_view.dart';
import 'package:home_space/features/chats/presentation/views/widgets/chat_room_view.dart';
import 'package:home_space/features/favourites/presentation/views/favourites_view.dart';
import 'package:home_space/features/favourites/presentation/views/widgets/no_listing_on_your_whishlist_yet.dart';
import 'package:home_space/features/home/presentation/views/home_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/home_notification_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_image_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/listing_card_details_view.dart';
import 'package:home_space/features/home/presentation/views/widgets/send_enquiry_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:home_space/features/settings/presentation/views/widgets/monthly_payment_breakdown_view.dart';
import 'package:home_space/features/settings/presentation/views/widgets/mortgage_calculator_form.dart';
import 'package:home_space/features/settings/presentation/views/widgets/settings_notifications_view.dart';
import 'package:home_space/features/splash/presentation/views/splash_view.dart';

import '../../features/favourites/presentation/views/widgets/favourites_list_tile_item_details.dart';
import '../../features/home/presentation/views/widgets/schedule_tour_view.dart';
import '../../features/home/presentation/views/widgets/send_enquiry_success_view.dart';
import '../../features/home/presentation/views/widgets/share_listing_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/settings/presentation/views/widgets/contact_support_view.dart';
import '../../features/settings/presentation/views/widgets/edit_profile.dart';
import '../../features/settings/presentation/views/widgets/help_center.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case LoginOrSignUpPassword.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginOrSignUpPassword(),
      );
    case FinishSignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const FinishSignUpView());
    case TurnOnNotification.routeName:
      return MaterialPageRoute(
        builder: (context) => const TurnOnNotification(),
      );
    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ResetPasswordView());
    case PasswordResetLinkView.routeName:
      return MaterialPageRoute(
        builder: (context) => const PasswordResetLinkView(),
      );
    case OnBoardingPageView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingPageView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case CustomBottomNavigationBar.routeName:
      return MaterialPageRoute(
        builder: (context) => const CustomBottomNavigationBar(),
      );
    case ListingCardDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ListingCardDetailsView(),
      );
    case ListingCardDetailsImageView.routeName:
      final String image = Assets.assetsImagesListingCardDetails;
      return MaterialPageRoute(
        builder: (context) => ListingCardDetailsImageView(image: image),
      );
    case SendEnquiryView.routeName:
      return MaterialPageRoute(builder: (context) => const SendEnquiryView());
    case SendEnquirySuccessView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SendEnquirySuccessView(),
      );
    case HomeNotificationView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeNotificationView(),
      );
    case ScheduleTourView.routeName:
      return MaterialPageRoute(builder: (context) => const ScheduleTourView());
    case ShareListingView.routeName:
      return MaterialPageRoute(builder: (context) => const ShareListingView());
    case FavouritesView.routeName:
      return MaterialPageRoute(builder: (context) => const FavouritesView());
    case FavouritesListTileItemDetails.routeName:
      return MaterialPageRoute(
        builder: (context) => const FavouritesListTileItemDetails(),
      );
    case NoListingOnYourWishlistYet.routeName:
      return MaterialPageRoute(
        builder: (context) => const NoListingOnYourWishlistYet(),
      );
    case SettingsView.routeName:
      return MaterialPageRoute(builder: (context) => const SettingsView());
    case HelpCenter.routeName:
      return MaterialPageRoute(builder: (context) => const HelpCenter());
    case EditProfile.routeName:
      return MaterialPageRoute(builder: (context) => const EditProfile());
    case MortgageCalculatorForm.routeName:
      return MaterialPageRoute(
        builder: (context) => const MortgageCalculatorForm(),
      );
    case MonthlyPaymentBreakdownView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MonthlyPaymentBreakdownView(),
      );
    case ContactSupportView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ContactSupportView(),
      );
    case SettingsNotificationsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SettingsNotificationsView(),
      );
    case ChatsView.routeName:
      return MaterialPageRoute(builder: (context) => const ChatsView());
    case ChatRoomView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChatRoomView(),
        settings: settings,
      );
    default:
      return null;
  }
}
