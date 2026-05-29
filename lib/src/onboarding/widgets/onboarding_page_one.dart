<<<<<<< HEAD
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child:Stack(
        children: [
          Image.asset('R.ASSETS_IMAGES_EXPERIENCE_PNG',fit: BoxFit.cover,),
          Positioned(
            bottom: 100.h,
            left: 20.w,
            right: 20.w,
            child: Text(AppText.onboardingOneTitle ?? '',textAlign: TextAlign.center,style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 46, 23, 23)),)
          )
        ]
      ),
    );
  }
}
=======
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_EXPERIENCE_PNG,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 200,
              left: 30,
              right: 30,
              child: Text(
                AppText.kOnboardHome,
                textAlign: TextAlign.center,
                style: appStyle(11, Kolors.kGray, FontWeight.normal),
              ))
        ],
      ),
    );
  }
}
>>>>>>> 4dd434b4efd5c81b5151152d3ad14a57285b5e97
