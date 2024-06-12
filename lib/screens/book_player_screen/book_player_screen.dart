import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itss2/screens/book_player_screen/list_player_screen.dart';
import 'package:itss2/screens/book_player_screen/notifier/book_player_notifier.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

import '../../models/sport.dart';
import '../../widgets/atoms/buttons/primarybutton.dart';

class BookPlayerScreen extends ConsumerStatefulWidget {
  const BookPlayerScreen({super.key});

  @override
  ConsumerState<BookPlayerScreen> createState() => _BookPlayerScreenState();
}

class _BookPlayerScreenState extends ConsumerState<BookPlayerScreen> {
  _buildListSportModal(BuildContext context) {
    List<Widget> sportComponents = [];

    listSport.forEach((sport) {
      sportComponents.add(PrimaryButton(
          onPressed: () {
            ref.read(bookPlayerNotifierProvider.notifier).setSport(sport.name);
            Navigator.pop(context);
          },
          child: Text(
            sport.name!,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )));
      sportComponents.add(SizedBox(
        height: 10,
      ));
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

  @override
  Widget build(BuildContext context) {
    final bookPlayerNotifier = ref.watch(bookPlayerNotifierProvider);
    return Scaffold(
      appBar: TitleAppbar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListPlayerScreen()));
              },
              child: Text(
                "Next",
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
          leadingButtonOnPressed: () => Navigator.pop(context),
          title: Text("Đặt đối",
              style: GoogleFonts.notoSans(
                  textStyle:
                      TextStyle(color: Colors.white, letterSpacing: .5)))),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            PrimaryButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => _buildListSportModal(context));
              },
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                  bookPlayerNotifier?.sport?? "Chọn môn thể thao",
                  style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))),
            ),
            const SizedBox(height: 5),
            PrimaryButton(
              onPressed: () async {
                final date = await showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
                ref.read(bookPlayerNotifierProvider.notifier).setDate(DateFormat('yyyy-MM-dd').format(date!));
                },
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                  bookPlayerNotifier.date??
                      "Chọn ngày",
                  style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))),
            ),
            const SizedBox(height: 5),
            PrimaryButton(
              onPressed: () async {
                final startTime = await showTimePicker(
                    initialEntryMode: TimePickerEntryMode.dialOnly,
                    context: context,
                    initialTime: const TimeOfDay(hour: 0, minute: 0));
                ref.read(bookPlayerNotifierProvider.notifier).setStartTime("${startTime!.hour}:${startTime.minute}");
              },
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                  bookPlayerNotifier?.startTime == null ?
                  "Chọn thời gian bắt đầu" : bookPlayerNotifier.startTime!,
                  style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))),
            ),
            const SizedBox(height: 5),
            PrimaryButton(
              onPressed: () async {
                final endTime = await showTimePicker(
                    initialEntryMode: TimePickerEntryMode.dialOnly,
                    context: context,
                    initialTime: TimeOfDay(hour: 0, minute: 0));
                ref.read(bookPlayerNotifierProvider.notifier).setEndTime("${endTime!.hour}:${endTime.minute}");
              },
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                  bookPlayerNotifier?.endTime == null ?
                  "Chọn thời gian kết thúc" : bookPlayerNotifier.endTime!,
                  style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))),
            ),
            const SizedBox(height: 5),
            PrimaryButton(
              // onPressed: () async {
              //   await _buildSelectTime(context);
              // },
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                  bookPlayerNotifier.needField
                      ? "Đã có sân"
                      : "Chưa có sân",
                  style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))),
            ),
          ],
        ),
      ),
    );
  }
}
