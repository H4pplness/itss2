import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/widgets/organisms/app_bars/title_appbar.dart';

class BookPlayerScreen extends ConsumerWidget {
  const BookPlayerScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: TitleAppbar(
          leadingButtonOnPressed: () => Navigator.pop(context),
          title: Text("Đặt đối",
              style: GoogleFonts.notoSans(
                  textStyle:
                      TextStyle(color: Colors.white, letterSpacing: .5)))),
      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           PrimaryButton(
      //             onPressed: () {
      //               showModalBottomSheet(
      //                   context: context,
      //                   builder: (context) => _buildBottomModal(context)
      //               );
      //             },
      //             width: MediaQuery.of(context).size.width * 0.8,
      //             child: Text(choice,
      //                 style: GoogleFonts.notoSans(
      //                     textStyle: const TextStyle(
      //                         color: Colors.white,
      //                         letterSpacing: .5,
      //                         fontWeight: FontWeight.w600,
      //                         fontSize: 15))),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(height: 5),
      //       Row(
      //         children: [
      //           PrimaryButton(
      //             onPressed: () {
      //               showModalBottomSheet(
      //                   context: context,
      //                   builder: (_)=>_buildCourseModal(_)
      //               );
      //             },
      //             width: MediaQuery.of(context).size.width * 0.8,
      //             child: Text(course??"",
      //                 style: GoogleFonts.notoSans(
      //                     textStyle: const TextStyle(
      //                         color: Colors.white,
      //                         letterSpacing: .5,
      //                         fontWeight: FontWeight.w600,
      //                         fontSize: 15))),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(height: 5),
      //       Row(
      //         children: [
      //           PrimaryButton(
      //             onPressed: () async {
      //               await _buildSelectTime(context);
      //             },
      //             width: MediaQuery.of(context).size.width * 0.8,
      //             child: Text("${_selectedTime.hour.toString()}:${_selectedTime.minute.toString()}",
      //                 style: GoogleFonts.notoSans(
      //                     textStyle: const TextStyle(
      //                         color: Colors.white,
      //                         letterSpacing: .5,
      //                         fontWeight: FontWeight.w600,
      //                         fontSize: 15))),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
