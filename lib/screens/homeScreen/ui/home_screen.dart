import 'package:blockflix/data/home_screen_data.dart';
import 'package:blockflix/screens/homeScreen/bloc/home_bloc.dart';
import 'package:blockflix/screens/homeScreen/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();
  List<Movie> actionMovieList = [];
  List<Movie> sciFiMovieList = [];
  List<Movie> romanceMovieList = [];

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  void setMovieList() {
    List<Movie> al = [];
    List<Movie> sl = [];
    List<Movie> rl = [];
    movies.forEach((element) {
      if (element.genre.contains("Action")) {
        al.add(element);
      }
      if (element.genre.contains("Sci-Fi")) {
        sl.add(element);
      }
      if (element.genre.contains("Romance")) {
        rl.add(element);
      }
    });
    setState(() {
      actionMovieList = al;
      sciFiMovieList = sl;
      romanceMovieList = rl;
    });
  }

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    // TODO: implement initState
    setMovieList();
    secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is NavigateToMovieScreen) {
          Navigator.pushNamed(context, "/moviedetail");
        }
      },
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeSuccessfulFetched:
            return Scaffold(
                body: Container(
              color: const Color(0xFF0E0412),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24.r,
                            foregroundImage: AssetImage("assets/monkey.jpeg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome !",
                                style: GoogleFonts.openSans(
                                    color: const Color(0xFFF5F5F5),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Movie Magic Awaits!",
                                style: GoogleFonts.openSans(
                                    color: const Color(0xFFE1E1E1),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                size: 30,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w),
                      child: Text(
                        "Action",
                        style: GoogleFonts.openSans(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFF5F5F5)),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 278.h,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: actionMovieList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Movie movie = sciFiMovieList[index];
                            return GestureDetector(
                              onTap: () => homeBloc.add(MovieButtonClickedEvent()),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.network(
                                        movie.imageUrl,
                                        height: 200.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            movie.name,
                                            style: GoogleFonts.openSans(
                                                color: const Color(0xFFF5F5F5),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.more_horiz))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${movie.year}",
                                              style: GoogleFonts.openSans(
                                                  color: const Color(0xFFE1E1E1),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                            "${movie.duration}",
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFE1E1E1)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w),
                      child: Text(
                        "Sci-Fi",
                        style: GoogleFonts.openSans(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFF5F5F5)),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 278.h,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: sciFiMovieList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Movie movie = actionMovieList[index];
                            return GestureDetector(
                              onTap: () => homeBloc.add(MovieButtonClickedEvent()),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.network(
                                        movie.imageUrl,
                                        height: 200.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            movie.name,
                                            style: GoogleFonts.openSans(
                                                color: const Color(0xFFF5F5F5),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.more_horiz))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${movie.year}",
                                              style: GoogleFonts.openSans(
                                                  color: const Color(0xFFE1E1E1),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                            "${movie.duration}",
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFE1E1E1)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w),
                      child: Text(
                        "Romance",
                        style: GoogleFonts.openSans(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFF5F5F5)),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 278.h,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: romanceMovieList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Movie movie = romanceMovieList[index];
                            return GestureDetector(
                              onTap: () => homeBloc.add(MovieButtonClickedEvent()),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.network(
                                        movie.imageUrl,
                                        height: 200.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            movie.name,
                                            style: GoogleFonts.openSans(
                                                color: const Color(0xFFF5F5F5),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.more_horiz))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${movie.year}",
                                              style: GoogleFonts.openSans(
                                                  color: const Color(0xFFE1E1E1),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                            "${movie.duration}",
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFE1E1E1)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ));
          default:
            return const Scaffold(
              body: Center(child: Text("Sorry, something went wrong")),
            );
        }
      },
    );
  }
}
