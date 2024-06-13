import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itss2/models/sport.dart';
import 'package:itss2/screens/book_player_screen/list_player_screen.dart';

import '../../widgets/atoms/cards/primary_card.dart';
import '../../widgets/organisms/app_bars/title_appbar.dart';

class ChooseTimeScreen extends ConsumerStatefulWidget {
  Sport sport;
  ChooseTimeScreen({super.key, required this.sport});

  @override
  ConsumerState createState() => _ChooseTimeScreenState();
}

class _ChooseTimeScreenState extends ConsumerState<ChooseTimeScreen> {
  DateTime? date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

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
                if (date != null && startTime != null && endTime != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListPlayerScreen(
                                sport: widget.sport,
                                startTime: "${startTime!.hour >= 10 ? "" : "0"}${startTime!.hour}:${startTime!.minute >= 10 ? "" : "0"}${startTime!.minute}",
                                endTime: "${endTime!.hour >= 10 ? "" : "0"}${endTime!.hour}:${endTime!.minute >= 10 ? "" : "0"}${endTime!.minute}",
                                date: date!,
                              )));
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
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryCard(
                onTap: () async {
                  final chooseDate = await showDatePicker(
                      context: context,
                      firstDate: new DateTime.now(),
                      lastDate: DateTime(2025));
                  setState(() {
                    date = chooseDate;
                  });
                },
                child: Text(
                  date != null
                      ? DateFormat('yyyy-MM-dd').format(date!)
                      : "Chọn ngày",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            PrimaryCard(
                onTap: () async {
                  final chooseTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: 0, minute: 0));
                  setState(() {
                    startTime = chooseTime;
                  });
                },
                child: Text(
                  startTime != null
                      ? "${startTime!.hour >= 10 ? "" : "0"}${startTime!.hour}:${startTime!.minute >= 10 ? "" : "0"}${startTime!.minute}"
                      : "Chọn thời gian bắt đầu",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            PrimaryCard(
                onTap: () async {
                  final chooseTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: 0, minute: 0));
                  setState(() {
                    endTime = chooseTime;
                  });
                },
                child: Text(
                  endTime != null
                      ? "${endTime!.hour >= 10 ? "" : "0"}${endTime!.hour}:${endTime!.minute >= 10 ? "" : "0"}${endTime!.minute}"
                      : "Chọn thời gian kết thúc",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
