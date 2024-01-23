import 'package:blockflix/data/user_screen_data.dart';
import 'package:blockflix/screens/homeScreen/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0E0412),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(children: [
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
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/splash");
                        },
                        child: Text("Logout"))
                  ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color.fromARGB(255, 43, 11, 55),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Full Name",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        user.userName,
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color.fromARGB(255, 43, 11, 55),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        user.email,
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color.fromARGB(255, 43, 11, 55),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Private Key",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        user.privateKey.substring(0, 5) +
                            "...." +
                            user.privateKey
                                .substring(user.privateKey.length - 4),
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color.fromARGB(255, 43, 11, 55),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date of Birth",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "${user.dob.day}.${user.dob.month}.${user.dob.year}",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.w),
                  child: Text(
                    "Purchased Movies",
                    style: GoogleFonts.openSans(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFF5F5F5)),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: user.boughtMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      Movie movie = user.boughtMovies[index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        constraints: BoxConstraints(maxHeight: 163.h),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 144, 108, 160),
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                movie.imageUrl,
                                height: 120,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "${movie.name}",
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: const Color(0xFFF5F5F5)),
                                  ),
                                  Text(
                                    "${movie.plot.substring(0, 75)}...",
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.sp,
                                        color: const Color(0xFFE1E1E1)),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${movie.year}",
                                        style: GoogleFonts.openSans(
                                            color: const Color(0xFFE2E2E2),
                                            fontSize: 20),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "/moviedetail");
                                          },
                                          child: Text(
                                            "Watch",
                                            style: GoogleFonts.openSans(
                                                fontSize: 12),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
