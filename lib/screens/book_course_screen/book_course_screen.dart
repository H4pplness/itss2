import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itss2/models/booking.dart';
import 'package:itss2/models/sport-field.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/screens/book_course_screen/notifiers/book_course_notifier.dart';
import 'package:itss2/widgets/atoms/buttons/primarybutton.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

class BookCourseScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<BookCourseScreen> createState() => _BookCourseScreenState();
}

class _BookCourseScreenState extends ConsumerState<BookCourseScreen> {
  _buildListSportModal(BuildContext context){
    List<Widget> sportComponents = [];

    listSport.forEach((sport) {
      sportComponents.add(
          PrimaryButton(
              onPressed: (){
                ref.read(bookCourseNotifierProvider.notifier).setSport(sport);
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
    final sport = ref.watch(bookCourseNotifierProvider);

    listSportField.where((field) => field.sport?.id == sport.sport?.id).forEach((field) {
      sportfieldComponents.add(
          PrimaryButton(
              onPressed: (){
                ref.read(bookCourseNotifierProvider.notifier).setField(field);
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width,
              child: Text(field.name!,
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

  _buildListMatch(BuildContext context){
    List<Widget> matchComponents = [];
    final sport = ref.watch(bookCourseNotifierProvider);

    sport.field?.matches?.forEach((match) {
      matchComponents.add(
          PrimaryButton(
              onPressed: (){
                ref.read(bookCourseNotifierProvider.notifier).setBooking(Booking(match: match));
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width,
              child: Text("${match.time!} ${DateFormat('yyyy-MM-dd').format(match!.date??DateTime(2024))}",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              )
          )
      );
      matchComponents.add(SizedBox(height: 10,));
    });

    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: matchComponents,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookfieldForm = ref.watch(bookCourseNotifierProvider);
    return Scaffold(
      appBar: TitleAppbar(
          leadingButtonOnPressed: (){ Navigator.pop(context); } ,
          actions: [
            IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.save,color: Colors.white,))
          ],
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
                  child: Text(bookfieldForm.sport?.name??"Chọn môn thể thao",
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
                    child: Text(bookfieldForm.field?.name?? "Chọn sân",
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
                          return _buildListMatch(context);
                        }
                    );
                  },
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text(bookfieldForm.booking?.match?.time??"Chọn thời gian",
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
