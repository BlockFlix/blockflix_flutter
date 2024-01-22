import 'package:blockflix/data/movie_detail_screen_data.dart';
import 'package:blockflix/screens/movieDetailsScreen/bloc/movie_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc movieDetailBloc = MovieDetailBloc();

  @override
  void initState() {
    // TODO: implement initState
    movieDetailBloc.add(MovieDetailInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailBloc, MovieDetailState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is NavigateToWatchMovie) {
          print("Hi");
          Navigator.pushNamed(context, '/moviewatch');
        }
      },
      listenWhen: (previous, current) => current is MovieDetailActionState,
      buildWhen: (previous, current) => current is! MovieDetailActionState,
      bloc: movieDetailBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case MovieDetailSuccessState:
            return Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      movie.imageUrl,
                      height: 300.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            movie.name,
                            style: GoogleFonts.openSans(
                                color: const Color(0xFFF5F5F5),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFB090F4))),
                              onPressed: () {
                                if (movie.isBought) {
                                  movieDetailBloc.add(ViewButtonClickedEvent());
                                } else {
                                  movieDetailBloc.add(BuyButtonClickedEvent());
                                }
                              },
                              child: Text(
                                "${movie.isBought ? 'Watch' : 'Buy 60K Gwei'}",
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                      child: Text(
                        "${movie.year}",
                        style: GoogleFonts.openSans(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFE1E1E1)),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      child: Text(
                        "Genre",
                        style: GoogleFonts.openSans(
                            color: const Color(0xFFF5F5F5),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: movie.genreList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Chip(
                                  label: Text(
                                "${movie.genreList[index]}",
                                style: GoogleFonts.openSans(
                                    color: const Color(0xFFB090F4),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              )),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "Plot",
                        style: GoogleFonts.openSans(
                            color: const Color(0xFFF5F5F5),
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        movie.plot,
                        style: GoogleFonts.openSans(
                            color: const Color(0xFFE1E1E1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      child: Text(
                        "Cast",
                        style: GoogleFonts.openSans(
                            color: const Color(0xFFF5F5F5),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: movie.cast.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Chip(
                                  label: Text(
                                "${movie.cast[index]}",
                                style: GoogleFonts.openSans(
                                    color: const Color(0xFFB090F4),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              )),
                            );
                          }),
                    ),
                  ],
                ),
              )),
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
