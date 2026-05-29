import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    navigator();
    super.initState();
  }

  void navigator() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (Storage().getBool('firstOpen') == null || Storage().getBool('firstOpen') == true) {
        GoRouter.of(context).go('/onboarding');
      } else {
        GoRouter.of(context).go('/home');
        
      }
    });
    // Navigate to the next screen, e.g., HomeScreen
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('R.ASSETS_IMAGES_SPLASHSCREEN_PNG'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
