import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/features/auth/presentation/views/login_view.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/on_boarding_page_view_body.dart';
import 'package:home_space/features/on_boarding/presentation/views/widgets/on_boarding_page_view_header.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  static const String routeName = "OnBoardingPageView";

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 29,
            left: kHorizontalPadding,
            right: kHorizontalPadding,
            bottom: kBottomPadding,
          ),
          child: Column(
            children: [
              OnBoardingPageViewHeader(
                currentPage: currentPage,
                backPressed: _goToPreviousPage,
              ),
              Expanded(
                child: OnBoardingPageViewBody(pageController: _pageController),
              ),
              CustomButton(
                onTap: () {
                  if (currentPage == 4) {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  }
                  _goToNextPage();
                },
                textContent: currentPage == 4 ? "Yes Notify, Me" : "Continue",
              ),
              const SizedBox(height: 12),
              CustomButton(
                onTap: () {
                  _goToNextPage();
                },
                textContent: "Skip",
                textContentColor: ColorsData.kPrimaryColor,
                backgroundColor: Colors.transparent,
                borderColor: ColorsData.kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToPreviousPage() {
    _pageController.animateToPage(
      currentPage - 1,
      duration: const Duration(milliseconds: kMillisecondsDuration),
      curve: Curves.bounceInOut,
    );
  }

  void _goToNextPage() {
    _pageController.animateToPage(
      currentPage + 1,
      duration: const Duration(milliseconds: kMillisecondsDuration),
      curve: Curves.bounceInOut,
    );
  }
}
