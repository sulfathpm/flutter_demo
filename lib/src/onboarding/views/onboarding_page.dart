import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:fashion_app/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:fashion_app/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:fashion_app/src/onboarding/widgets/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late final PageController _pageController;

  @override
  void initState() {

    _pageController = PageController(
      initialPage:
          context.read<OnboardingNotifier>().selectedPage,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final pro = Provider.of<OnboardingNotifier>(context);

    return Scaffold(
      body: Stack(
        children: [

          PageView(
            controller: _pageController,

            onPageChanged: (page) {

              // Update provider state
              context
                  .read<OnboardingNotifier>()
                  .setSelectedPage(page);
            },

            children: const [

              WelcomePage(),

              OnboardingPageOne(),

              OnboardingPageTwo(),
            ],
          ),


context.watch<OnboardingNotifier>().selectedPage == 2
              ? SizedBox.shrink()
              :
          Positioned(
            bottom: 50.h,

            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w),

              width: ScreenUtil().screenWidth,

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                crossAxisAlignment:
                    CrossAxisAlignment.center,

                children: [

                  /// LEFT BUTTON
                  GestureDetector(
                    onTap: () {

                      if (pro.selectedPage > 0) {

                        _pageController.previousPage(
                          duration: const Duration(
                              milliseconds: 300),

                          curve: Curves.easeIn,
                        );
                      }
                    },

                    child: const Icon(
                      AntDesign.leftcircleo,
                      color: Kolors.kPrimary,
                      size: 30,
                    ),
                  ),

                  /// DOT INDICATOR
                  SizedBox(
                    width:
                        ScreenUtil().screenWidth * 0.7,

                    height: 50.h,

                    child: PageViewDotIndicator(
                      currentItem: pro.selectedPage,

                      count: 3,

                      unselectedColor: Colors.black26,

                      selectedColor: Kolors.kPrimary,

                      duration:
                          const Duration(milliseconds: 200),

                      onItemClicked: (index) {

                        _pageController.animateToPage(
                          index,

                          duration: const Duration(
                              milliseconds: 300),

                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  ),

                  /// RIGHT BUTTON
                  GestureDetector(
                    onTap: () {

                      if (pro.selectedPage < 2) {

                        _pageController.nextPage(
                          duration: const Duration(
                              milliseconds: 300),

                          curve: Curves.easeIn,
                        );
                      }
                    },

                    child: const Icon(
                      AntDesign.rightcircleo,
                      color: Kolors.kPrimary,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}