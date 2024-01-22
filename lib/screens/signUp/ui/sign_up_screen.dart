import 'package:blockflix/screens/signUp/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    // TODO: implement initState
    signUpBloc.add(SignUpInitialEvent());
    secureScreen();
    super.initState();
  }

  SignUpBloc signUpBloc = SignUpBloc();
  TextEditingController privateKeyController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  DateTime _selectedDate = DateTime(2004, 5, 24);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is CreateAccountSuccessfulState) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        } else if (state is NavigateToLoginScreen) {
          Navigator.pushNamed(context, "/login");
        }
      },
      bloc: signUpBloc,
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SignUpInitial:
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/splash_background.png"),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                  child: SizedBox(
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
                                "Create Account",
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
                                controller: userNameController,
                                style: GoogleFonts.openSans(
                                    color: Colors.white, fontSize: 16.sp),
                                decoration: InputDecoration(
                                    hintStyle: GoogleFonts.openSans(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 15),
                                    hintText: "User Name",
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
                                height: 10.h,
                              ),
                              TextField(
                                controller: emailController,
                                style: GoogleFonts.openSans(
                                    color: Colors.white, fontSize: 16.sp),
                                decoration: InputDecoration(
                                    hintStyle: GoogleFonts.openSans(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 15),
                                    hintText: "Email",
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
                                height: 10.h,
                              ),
                              TextField(
                                controller: privateKeyController,
                                style: GoogleFonts.openSans(
                                    color: Colors.white, fontSize: 16.sp),
                                decoration: InputDecoration(
                                    hintStyle: GoogleFonts.openSans(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 15),
                                    hintText: "Private Key",
                                    filled: true,
                                    fillColor: Color.fromRGBO(79, 51, 88, 1),
                                    suffixIcon: Tooltip(
                                      message:
                                          'Enter the private key of your MetaMask account',
                                      child: Icon(Icons.info),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(85, 75, 88, 1),
                                            width: 1))),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextField(
                                controller: dobController,
                                decoration: InputDecoration(
                                    hintStyle: GoogleFonts.openSans(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 15),
                                    hintText: "Date of Birth",
                                    filled: true,
                                    fillColor: Color.fromRGBO(79, 51, 88, 1),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(85, 75, 88, 1),
                                            width: 1))),
                                readOnly: true,
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Center(
                                child: Container(
                                  width: 353.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: const Color(0xFFB090F4)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      signUpBloc.add(
                                          CreateAccountButtonClickedEvent());
                                    },
                                    child: Center(
                                      child: Text(
                                        "Create Account",
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
                                height: 10,
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    signUpBloc
                                        .add(LoginScreenNavigateClickedEvent());
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "Already have an account ?  ",
                                      style: GoogleFonts.openSans(
                                          color: const Color(0xFFF5F5F5),
                                          fontSize: 14.sp),
                                    ),
                                    TextSpan(
                                      text: "Login",
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
