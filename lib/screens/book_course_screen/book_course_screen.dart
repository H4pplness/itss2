import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/models/sport-field.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/widgets/atoms/buttons/primarybutton.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

class BookCourseScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<BookCourseScreen> createState() => _BookCourseScreenState();
}

class _BookCourseScreenState extends ConsumerState<BookCourseScreen> {
  late Sport choice;
  late String course;
  late String time;

  _buildListSportModal(BuildContext context){
    List<Widget> sportComponents = [];

    listSport.forEach((sport) {
      sportComponents.add(
          PrimaryButton(
              onPressed: (){
                setState(() {
                  choice = sport;
                });
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width,
              child: Text(sport.name!,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              )
          )
      );
      sportComponents.add(SizedBox(height: 10,));
    });

    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: sportComponents,
        ),
      ),
    );
  }

  _buildListSportField(BuildContext context){
    List<Widget> sportfieldComponents = [];

    listSportField.forEach((sport) {
      sportfieldComponents.add(
          PrimaryButton(
              onPressed: (){
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width,
              child: Text(sport.name!,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              )
          )
      );
      sportfieldComponents.add(SizedBox(height: 10,));
    });

    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: sportfieldComponents,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppbar(
          leadingButtonOnPressed: () => Navigator.pop(context),
          title: Text("Đặt sân",
              style: GoogleFonts.notoSans(
                  textStyle:
                      TextStyle(color: Colors.white, letterSpacing: .5)))),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                PrimaryButton(
                  onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context){
                          return _buildListSportModal(context);
                        }
                    );
                  },
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
                  onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context){
                          return _buildListSportField(context);
                        }
                    );
                  },
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
