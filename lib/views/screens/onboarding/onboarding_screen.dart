import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/controllers/onboarding_provider.dart';
import 'package:jobhubv2_0/views/common/app_style.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';
import 'package:jobhubv2_0/views/screens/onboarding/widget/PageOne.dart';
import 'package:jobhubv2_0/views/screens/onboarding/widget/PageThree.dart';
import 'package:jobhubv2_0/views/screens/onboarding/widget/PageTwo.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardNotifier>(
        builder: (context, onBoarding, child) {
          return Stack(
            children: [
              PageView(
                controller: pageController,
                // physics: onBoarding.islastPage
                //     ? NeverScrollableScrollPhysics()
                //     : AlwaysScrollableScrollPhysics(),
                physics: AlwaysScrollableScrollPhysics(),
                onPageChanged: (page) {
                  onBoarding.islastPage = page == 2;
                },
                children: const [PageOne(), PageTwo(), PageThree()],
              ),
              onBoarding.islastPage
                  ? const SizedBox.shrink()
                  : Positioned(
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: WormEffect(
                              dotHeight: 12,
                              dotWidth: 12,
                              spacing: 10,
                              dotColor: Color(kLight.value),
                              activeDotColor: Color(kOrange.value)),
                        ),
                      ),
                      bottom: hieght * 0.12,
                      left: 0,
                      right: 0,
                    ),
              Positioned(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: onBoarding.islastPage
                      ? SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.jumpToPage(2);
                              },
                              child: ReusableText(
                                  text: "Skip",
                                  style: appStyle(16, Color(kLight.value),
                                      FontWeight.normal)),
                            ),
                            GestureDetector(
                              onTap: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                              child: ReusableText(
                                  text: "Next",
                                  style: appStyle(16, Color(kLight.value),
                                      FontWeight.normal)),
                            )
                          ],
                        ),
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
