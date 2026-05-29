import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/src/splashscreen/views/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // 1. FIXED: Correct standalone initialization call
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. FIXED: Asynchronously load environment files before launching UI
  await dotenv.load(fileName: Environment.fileName);

  getStorageInit() async {
    await GetStorage.init();
  }
  runApp(mutiProviders: [
    Provider(create: (_) => OnboardingNotifier()),
  ], child: const MyApp());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen size metrics for responsiveness
    Size screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        // 3. FIXED: Changed to .router to hand navigation control to GoRouter
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            // 4. FIXED: Re-attached the missing class descriptor string prefix
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // 5. FIXED: Points to your global router configuration variable from app_routes.dart
          routerConfig: router, 
        );
      },
      child: const SplashScreen(),
    );
  }
}