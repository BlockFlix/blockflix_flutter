import 'package:blockflix/screens/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = LoginBloc();
  TextEditingController textEditingController = TextEditingController();

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    // TODO: implement initState
    loginBloc.add(LoginInitialEvent());
    secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccessfulState) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        } else if (state is NavigateToSignUpScreen) {
          Navigator.pushNamed(context, "/signup");
        }
      },
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is! LoginActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoginInitial:
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/splash_background.png"),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              vertical: 26.h, horizontal: 14.w),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 30, 18, 34),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.r),
                                  topRight: Radius.circular(25.r))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              TextField(
                                controller: textEditingController,
                                style: GoogleFonts.openSans(
                                    color: Colors.white, fontSize: 16.sp),
                                decoration: InputDecoration(
                                    hintStyle: GoogleFonts.openSans(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 15),
                                    hintText: "Enter Private Key",
                                    filled: true,
                                    fillColor: Color.fromRGBO(79, 51, 88, 1),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(85, 75, 88, 1),
                                            width: 1))),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Enter your metamask account private key to login in your account.",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 173, 173, 173),
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Center(
                                child: Container(
                                  width: 353.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: const Color(0xFFB090F4)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      loginBloc.add(LoginButtonClickedEvent());
                                    },
                                    child: Center(
                                      child: Text(
                                        "Login",
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
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    loginBloc.add(
                                        CreateAccountNavigateClickedEvent());
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "Don't have an account ?  ",
                                      style: GoogleFonts.openSans(
                                          color: const Color(0xFFF5F5F5),
                                          fontSize: 14.sp),
                                    ),
                                    TextSpan(
                                      text: "Create Account",
                                      style: GoogleFonts.openSans(
                                          color: const Color(0xFFF5F5F5),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ])),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          default:
            return const Scaffold(
              body: Center(child: Text("Sorry, something went wrong")),
            );
        }
      },
    );
  }
}
