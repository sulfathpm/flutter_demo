import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
<<<<<<< HEAD
import 'package:fashion_app/src/splashscreen/views/splashscreen_page.dart';
=======
import 'package:fashion_app/src/categories/controllers/category_notifier.dart';
import 'package:fashion_app/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:fashion_app/src/home/controllers/home_tab_notifier.dart';
import 'package:fashion_app/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_notifier.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:fashion_app/src/splashscreen/views/splashscreen_screen.dart';
>>>>>>> 4dd434b4efd5c81b5151152d3ad14a57285b5e97
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
<<<<<<< HEAD

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
=======
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //load the correct environment

  await dotenv.load(fileName: Environment.fileName);

  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
     ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
     ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
     ChangeNotifierProvider(create: (_) => CategoryNotifier()),
     ChangeNotifierProvider(create: (_) => HomeTabNotifier()),
     ChangeNotifierProvider(create: (_) => ProductNotifier()),
     ChangeNotifierProvider(create: (_) => ColorSizesNotifier()),
    ],
     child: const MyApp(),
  ));
>>>>>>> 4dd434b4efd5c81b5151152d3ad14a57285b5e97
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: screenSize,
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppText.kAppName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: router,
          );
        },
        child: const SplashScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Environment.appBaseUrl),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
>>>>>>> 4dd434b4efd5c81b5151152d3ad14a57285b5e97
