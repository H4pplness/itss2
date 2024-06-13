import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/apis/get_sport_field/get_sport_field.dart';
import 'package:itss2/models/sport-field.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/widgets/atoms/buttons/primarybutton.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';
import 'package:itss2/widgets/sport_field_card.dart';

class FindCourseScreen extends ConsumerStatefulWidget {
  const FindCourseScreen({super.key});

  @override
  ConsumerState<FindCourseScreen> createState() => _FindCourseScreenState();
}

class _FindCourseScreenState extends ConsumerState<FindCourseScreen> {
  late String choice;
  List<SportField> sportFieldResults = <SportField>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      choice = "Chọn môn thể thao";
    });
  }

  _fetchSportField(String sport) async {
    final listSportField = await ref.read(getSportFieldProvider(sport).future);
    setState(() {
      sportFieldResults = listSportField??[];
    });
  }

  _buildBottomModal(BuildContext context) {
    List<Widget> widgets = [];

    listSport.forEach((element) {
      widgets.add(PrimaryButton(
          onPressed: () {
            setState(() {
              choice = element.name!;
            });
            Navigator.pop(context);
          },
          width: MediaQuery.of(context).size.width,
          child: Text(
            element.name!,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )));
      widgets.add(SizedBox(height: 5));
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: widgets,
        ),
      ),
    );
  }

  _buildSearchDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Đang tìm kiếm ...",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 16,
            ),
            PrimaryButton(
              width: 100,
              child: Center(
                child: Text(
                  "Hủy",
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18.0),
                ),
              ),
              onPressed: () {
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Môn thể thao :',
                      style: GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => _buildBottomModal(context),
                      );
                    },
                    child: Text(
                      choice,
                      style: GoogleFonts.notoSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                      onPressed: () async {
                        setState(() {
                          sportFieldResults = <SportField>[];
                        });
                        showDialog(
                            context: context,
                            builder: (context) => _buildSearchDialog(context));

                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.pop(context);
                          _fetchSportField(choice == "Bóng đá" ? 'football' : choice== "Cầu lông" ? 'badminton' : 'basketball');
                        });
                      },
                      iconSize: 150, // Adjust icon size to fit inside circle
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: sportFieldResults
                        .where((f) => f.sport!.name == choice)
                        .map((f) => SportFieldCard(field: f))
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
