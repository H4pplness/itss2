import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itss2/models/booking.dart';
import 'package:itss2/models/sport-field.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/screens/book_course_screen/choose_sport_field_screen.dart';
import 'package:itss2/screens/book_course_screen/notifiers/book_course_notifier.dart';
import 'package:itss2/widgets/atoms/buttons/primarybutton.dart';
import 'package:itss2/widgets/atoms/cards/primary_card.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

class BookCourseScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<BookCourseScreen> createState() => _BookCourseScreenState();
}

class _BookCourseScreenState extends ConsumerState<BookCourseScreen> {
  Sport? sport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppbar(
          leadingButtonOnPressed: () {
            Navigator.pop(context);
          },
          actions: [
            TextButton(
                onPressed: () {
                  if(sport!=null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseSportFieldScreen(sport: sport!)));
                  }
                },
                child: Text(
                  "Tiếp tục",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ))
          ],
          title: Text("Đặt sân",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 20,fontWeight: FontWeight.w600,
                      color: Colors.white, letterSpacing: .5)))),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Chọn môn thể thao :",
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryCard(
                onTap: () {
                  setState(() {
                    sport = football;
                  });
                },
                backGroundColor: sport == football
                    ? Colors.teal
                    : Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    const Icon(
                      Icons.sports_soccer,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Bóng đá",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              PrimaryCard(
                onTap: () {
                  setState(() {
                    sport = badminton;
                  });
                },
                backGroundColor: sport == badminton
                    ? Colors.teal
                    : Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    const Icon(
                      Icons.sports_tennis,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cầu lông",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              PrimaryCard(
                onTap: () {
                  setState(() {
                    sport = basketball;
                  });
                },
                backGroundColor: sport == basketball
                    ? Colors.teal
                    : Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    const Icon(
                      Icons.sports_basketball,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Bóng rổ",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
