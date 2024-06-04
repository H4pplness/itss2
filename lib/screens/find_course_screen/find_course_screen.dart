import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/widgets/atoms/buttons/primarybutton.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

class FindCourseScreen extends StatefulWidget {
  const FindCourseScreen({super.key});

  @override
  State<FindCourseScreen> createState() => _FindCourseScreenState();
}

class _FindCourseScreenState extends State<FindCourseScreen> {
  late String choice;

  List<String> listChoice = [
    "Bóng đá",
    "Cầu lông",
    "Bóng rổ",
  ];

  @override
  void initState()
  {
    super.initState();
    setState(() {
      choice = "Chọn môn thể thao";
    });
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

  _buildSearchDialog(BuildContext context)
  {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Đang tìm kiếm ...",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            PrimaryButton(
              width: 100,
              child: Center(
                child: Text("Hủy",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppbar(
        leadingButtonOnPressed: () => Navigator.pop(context),
        title: Text(
          "Tìm sân nhanh",
          style: GoogleFonts.notoSans(
              textStyle: TextStyle(color: Colors.white, letterSpacing: .5)),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Môn thể thao :',
                    style: GoogleFonts.notoSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                PrimaryButton(
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => _buildBottomModal(context)
                      );
                    },
                    child: Text(choice,
                        style: GoogleFonts.notoSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))

                ),
              ],
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColor,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                padding: EdgeInsets.all(20),
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => _buildSearchDialog(context)
                  );
                },
                iconSize: 150, // Adjust icon size to fit inside circle
              ),
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}

