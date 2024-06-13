import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itss2/apis/create_booking_player/create_booking_player.dart';
import 'package:itss2/apis/get_booking_player/get_booking_player.dart';
import 'package:itss2/apis/invite_user/invite_user.dart';
import 'package:itss2/widgets/atoms/cards/invite_card.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

import '../../models/sport.dart';

class ListPlayerScreen extends ConsumerWidget {
  final String startTime;
  final String endTime;
  final DateTime date;
  final Sport sport;

  ListPlayerScreen(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.date,
      required this.sport});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPlayer = ref.read(getBookingPlayerProvider(GetBookingPlayerParams(
            date: DateFormat('yyyy-MM-dd').format(date),
            startTime: startTime,
            endTime: endTime,
            sport: sport.englishName))
        .future);
    return Scaffold(
        appBar: TitleAppbar(
          leadingButtonOnPressed: () => Navigator.pop(context),
          actions: [
            TextButton(
                onPressed: () async {
                  await ref.read(createBookingPlayerProvider(
                      CreateBookingPlayerBody(
                          date: DateFormat('yyyy-MM-dd').format(date),
                          startTime: startTime,
                          endTime: endTime,
                          sport: sport.englishName)));
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  "Lưu",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ),
        body: FutureBuilder(
            future: listPlayer,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final listPlayer = snapshot.data as List;
                if (listPlayer.isEmpty) {
                  return Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text(
                        "Không có ai đang tìm đối phù hợp với bạn",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, color: Colors.black),
                      ));
                }
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                        children: listPlayer
                            .map((player) => InviteCard(
                          onPressed: () async{
                            await ref.read(inviteUserProvider(player.bookingPlayerId));
                          },
                                name: player.username!,
                                startTime: player.startTime!,
                                endTime: player.endTime!,
                                date: player.date!))
                            .toList()),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container();
              }
            }));
  }
}
