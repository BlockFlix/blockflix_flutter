import 'package:blockflix/screens/splashScreen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc splashBloc = SplashBloc();

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    // TODO: implement initState
    splashBloc.add(SplashInitialEvent());
    secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SplashNaviagateToLoginState) {
            Navigator.pushNamed(context, "/login");
          }
        },
        bloc: splashBloc,
        listenWhen: (previous, current) => current is SplashActionState,
        buildWhen: (previous, current) => current is! SplashActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case SplashInitial:
              return Scaffold(
                body: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/splash_background.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "BlockFlix",
                        style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.w600,
                            fontSize: 32.sp,
                            color: const Color(0xFFF5F5F5)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "No matter what your mood or preference, BlockFlix has the perfect movie or show to match.",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFE1E1E1),
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Center(
                        child: Container(
                          width: 353.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: const Color(0xFFB090F4)),
                          child: MaterialButton(
                            onPressed: () {
                              splashBloc.add(GetStartedButtonClickedEvent());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 16.h),
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: const Color(0xFFF5F5F5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );

            default:
              return const Scaffold(
                body: Center(child: Text("Sorry, something went wrong")),
              );
          }
        });
  }
}
