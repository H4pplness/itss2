import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/screens/book_course_screen/book_course_screen.dart';
import 'package:itss2/screens/book_player_screen/book_player_screen.dart';
import 'package:itss2/screens/find_course_screen/find_course_screen.dart';
import 'package:itss2/screens/find_player_screen/find_player_screen.dart';
import 'package:itss2/widgets/atoms/cards/primary_card.dart';
import 'package:itss2/widgets/organisms/app_bars/home_page_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomePageAppbar(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  PrimaryCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookCourseScreen()));
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.sports_soccer,color: Colors.white,),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Đặt sân",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookPlayerScreen()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.saved_search),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Đặt đối",
                              style: GoogleFonts.notoSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FindCourseScreen()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.saved_search),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Tìm sân nhanh",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  // PrimaryCard(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => FindPlayerScreen()));
                  //     },
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.saved_search),
                  //         SizedBox(
                  //           width: 15,
                  //         ),
                  //         Text("Tìm đối nhanh",
                  //             style: TextStyle(
                  //                 fontSize: 20,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Colors.white))
                  //       ],
                  //     )),
                ],
              ),
            ),
          ),
        ));
  }
}
