import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      width:ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child:Stack(
        children: [
          Image.asset('R.ASSETS_IMAGES_WISHLIST_PNG',fit: BoxFit.cover,),
          Positioned(
            bottom: 100.h,
            left: 20.w,
            right: 20.w,
            child: Text(AppText.kOnboardWishListMessage ,textAlign: TextAlign.center,style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 46, 23, 23)),)
          )
        ]
      ),
    );
  }
}