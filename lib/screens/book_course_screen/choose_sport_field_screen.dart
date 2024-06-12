import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/apis/get_sport_field/get_sport_field.dart';
import 'package:itss2/screens/book_course_screen/choose_match_screen.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';
import 'package:itss2/widgets/sport_field_card.dart';

import '../../models/sport-field.dart';
import '../../models/sport.dart';

class ChooseSportFieldScreen extends ConsumerStatefulWidget {
  Sport sport;
  ChooseSportFieldScreen({super.key, required this.sport});

  @override
  ConsumerState createState() => _ChooseSportFieldScreenState();
}

class _ChooseSportFieldScreenState
    extends ConsumerState<ChooseSportFieldScreen> {
  SportField? choice;

  List<Widget> _buildListSportField(List<SportField>? listSportField) {
    print(">>>>>>>>>>");
    if (listSportField == null || listSportField.isEmpty)
      return [
        Container(
          height: 100,
          width: 100,
          color: Colors.black,
        )
      ];
    List<Widget> sportFieldComponent = [];
    listSportField.forEach((field) {
      sportFieldComponent.add(SportFieldCard(
        field: field,
        onTap: () {
          setState(() {
            choice = field;
          });
        },
        backgroundColor: field == choice ? Colors.grey[400]! : Colors.white,
      ));
      sportFieldComponent.add(SizedBox(
        height: 10,
      ));
    });

    return sportFieldComponent;
  }

  @override
  Widget build(BuildContext context) {
    final listSportField =
        ref.watch(getSportFieldProvider(widget.sport.englishName));
    return Scaffold(
        appBar: TitleAppbar(
          leadingButtonOnPressed: () => Navigator.pop(context),
          actions: [
            TextButton(
                onPressed: () {
                  if (choice != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChooseMatchScreen(sportField: choice!)));
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
        ),
        body: listSportField.when(
            data: (listfield) {
              print("Data loaded: ${listfield!.length} fields");
              return Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: _buildListSportField(listfield),
                  ),
                ),
              );
            },
            error: (error, stack) {
              print("Error loading sport fields: $error");
              return Center(child: Text("An error occurred: $error"));
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
