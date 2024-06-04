import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/widgets/atoms/buttons/primarybutton.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

class BookPlayerScreen extends StatefulWidget {
  const BookPlayerScreen({super.key});

  @override
  State<BookPlayerScreen> createState() => _BookPlayerScreenState();
}

class _BookPlayerScreenState extends State<BookPlayerScreen> {
  late String choice;
  late String course;
  late String time;

  List<String> listChoice = [
    "Bóng đá",
    "Cầu lông",
    "Bóng rổ",
  ];

  List<String> listCourse = [
    "Sân 1",
    "Sân 2",
    "Sân 3"
  ];

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _buildSelectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  void initState()
  {
    super.initState();
    setState(() {
      choice = "Chọn môn thể thao";
      course = "Chọn sân";
    });
  }

  _buildCourseModal(BuildContext context)
  {
    List<Widget> widgets = [];

    listCourse.forEach((element) {
      widgets.add(
          PrimaryButton(
              onPressed: (){
                setState(() {
                  course = element;
                });
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width,
              child: Text(element,
                style: const TextStyle(color: Colors.white, fontSize: 18.0),
              )
          )
      );
      widgets.add(
          const SizedBox(height: 5)
      );
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.7,
      child: SingleChildScrollView(
        child: Column(
          children: widgets,
        ),
      ),
    );
  }

  _buildBottomModal(BuildContext context)
  {
    List<Widget> widgets = [];

    listChoice.forEach((element) {
      widgets.add(
          PrimaryButton(
              onPressed: (){
                setState(() {
                  choice = element;
                });
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width,
              child: Text(element,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              )
          )
      );
      widgets.add(
          SizedBox(height: 5)
      );
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.7,
      child: SingleChildScrollView(
        child: Column(
          children: widgets,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppbar(
          leadingButtonOnPressed: () => Navigator.pop(context),
          title: Text("Đặt đối",
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
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => _buildBottomModal(context)
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(choice,
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w600,
                              fontSize: 15))),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                PrimaryButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (_)=>_buildCourseModal(_)
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(course??"",
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w600,
                              fontSize: 15))),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                PrimaryButton(
                  onPressed: () async {
                    await _buildSelectTime(context);
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text("${_selectedTime.hour.toString()}:${_selectedTime.minute.toString()}",
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w600,
                              fontSize: 15))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
