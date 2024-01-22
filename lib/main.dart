import 'package:blockflix/screens/homeScreen/ui/home_screen.dart';
import 'package:blockflix/screens/login/ui/login_screen.dart';
import 'package:blockflix/screens/movieDetailsScreen/ui/movie_detail_screen.dart';
import 'package:blockflix/screens/movieWatchingScreen/ui/movie_watching_screen.dart';
import 'package:blockflix/screens/signUp/ui/sign_up_screen.dart';
import 'package:blockflix/screens/splashScreen/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BlockFlix',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          routes: {
            "/splash": (context) => const SplashScreen(),
            "/login" : (context) => const LoginScreen(),
            "/": (context) => const HomeScreen(),
            "/signup" : (context) => const SignUpScreen(),
            "/moviedetail":(context) => const MovieDetailScreen(),
            "/moviewatch" : (context) => const MovieWatchingScreen(),
          },
          initialRoute: "/splash",
        );
      },
    );
  }
}
