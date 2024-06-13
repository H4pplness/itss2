import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/apis/get_invitations/get_invitations.dart';
import 'package:itss2/apis/get_my_booking_player/get_my_booking_player.dart';
import 'package:itss2/apis/update_invitation/update_invitation.dart';
import 'package:itss2/screens/book_player_screen/book_player_screen.dart';
import '../../../widgets/atoms/cards/primary_card.dart';

class BookPlayerTab extends ConsumerWidget {
  const BookPlayerTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listInvitation = ref.read(getInvitationsProvider.future);
    final listBooking = ref.read(getMyBookingPlayerProvider.future);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            PrimaryCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookPlayerScreen()));
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.sports_soccer,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Đặt đối",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lời mời :",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            FutureBuilder(
                future: listInvitation,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listInvitation = snapshot.data;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listInvitation!.map((invitation) {
                        final status = invitation.status == 'waiting'
                            ? 1
                            : invitation.status == 'accepted'
                                ? 2
                                : 3;
                        return Container(
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${invitation.name}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                Text("${invitation.date}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600)),
                                Text(
                                    "${invitation.start_time} - ${invitation.end_time}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          if (status == 1) {
                                            await ref.read(
                                                updateInvitationProvider(
                                                    UpdateInvitationParam(
                                                        invitationId:
                                                            invitation.id,
                                                        status: 'accepted')));
                                          }
                                        },
                                        child: Text("Accept",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17,
                                                color: status == 1
                                                    ? Colors.greenAccent
                                                    : status == 2
                                                        ? Colors.green
                                                        : Colors.grey,
                                                fontWeight: FontWeight.w600))),
                                    TextButton(
                                        onPressed: () async {
                                          if (status == 1) {
                                            await ref.read(
                                                updateInvitationProvider(
                                                    UpdateInvitationParam(
                                                        invitationId:
                                                            invitation.id,
                                                        status: 'rejected')));
                                          }
                                        },
                                        child: Text("Reject",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17,
                                                color: status == 1
                                                    ? Colors.redAccent
                                                    : status == 3
                                                        ? Colors.red
                                                        : Colors.grey,
                                                fontWeight: FontWeight.w600)))
                                  ],
                                ),
                              ],
                            ));
                      }).toList(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Container();
                  }
                }),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lịch đã đặt :",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            FutureBuilder(
                future: listBooking,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listBooking =
                        snapshot.data as List<GetMyBookingPlayerDTO>;
                    return Column(
                      children: listBooking
                          .map((e) => Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width - 40,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).primaryColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.date!,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "${e.start_time} - ${e.end_time}",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      e.sport! == 'football' ? "Bóng đá" : e.sport! == 'badminton' ? "Cầu lông" : "Bóng rổ",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
    );
  }
}
