import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/widgets/atoms/buttons/primarybutton.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

class BookCourseScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: TitleAppbar(
          leadingButtonOnPressed: () => Navigator.pop(context),
          title: Text("Đặt sân",
              style: GoogleFonts.notoSans(
                  textStyle:
                      TextStyle(color: Colors.white, letterSpacing: .5)))),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                PrimaryButton(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text("Chọn môn thể thao",
                      style: GoogleFonts.notoSans(
                          textStyle:
                          TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w600,fontSize: 15))),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                PrimaryButton(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Text("Chọn sân",
                        style: GoogleFonts.notoSans(
                            textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w600,fontSize: 15))),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                PrimaryButton(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text("Chọn thời gian",
                      style: GoogleFonts.notoSans(
                          textStyle:
                          TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w600,fontSize: 15))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
