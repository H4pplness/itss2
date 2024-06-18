import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itss2/apis/get_field_bookings/get_field_bookings.dart';
import 'package:itss2/apis/get_match_by_field/get_match_by_field.dart';
import 'package:itss2/widgets/atoms/cards/primary_card.dart';
import '../../models/match.dart';
import '../../apis/book_field/book_field.dart';
import '../../models/sport-field.dart';
import '../../widgets/organisms/app_bars/title_appbar.dart';

class ChooseMatchScreen extends ConsumerStatefulWidget {
  final SportField sportField;
  ChooseMatchScreen({super.key, required this.sportField});

  @override
  ConsumerState createState() => _ChooseMatchScreenState();
}

class _ChooseMatchScreenState extends ConsumerState<ChooseMatchScreen> {
  Match? match;
  DateTime? date;
  List<Match> listMatch = [];

  Future<void> _fetchMatches() async {
    if (date != null) {
      final matchesFuture = await ref.read(getMatchByFieldProvider(
        GetMatchByFieldParam(
            fieldId: widget.sportField.id,
            date: DateFormat('yyyy-MM-dd').format(date!)),
      ).future);
      listMatch = matchesFuture!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppbar(
        leadingButtonOnPressed: () => Navigator.pop(context),
        actions: [
          TextButton(
              onPressed: () async {
                if (match != null && date != null) {
                  final newBooking = BookFieldData(
                      matchId: match!.id,
                      date: DateFormat('yyyy-MM-dd').format(date!));
                  await ref.read(bookFieldProvider(newBooking));
                  ref.read(bookingNotifierProvider.notifier).addBooking(
                      GetFieldBookingDTO(
                          date: DateFormat('yyyy-MM-dd').format(date!),
                          startTime: match!.startTime,
                          endTime: match!.endTime,
                          fieldName: match!.fieldName,
                          location: widget.sportField.location));
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Đặt sân",
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
                  await _fetchMatches();
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
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: listMatch
                    .map((getMatch) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: PrimaryCard(
                              backGroundColor:
                                  (match != null && getMatch.id == match!.id!)
                                      ? Colors.teal[200]
                                      : Theme.of(context).primaryColor,
                              onTap: () {
                                setState(() {
                                  match = getMatch;
                                });
                              },
                              width: MediaQuery.of(context).size.width - 40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getMatch.fieldName!,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    "${getMatch.startTime} - ${getMatch.endTime}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "Giá : ${getMatch.price!}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )),
                        ))
                    .toList(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
