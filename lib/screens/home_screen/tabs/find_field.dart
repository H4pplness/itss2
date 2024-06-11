import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itss2/screens/find_course_screen/find_course_screen.dart';

import '../../../widgets/atoms/cards/primary_card.dart';
import '../../book_course_screen/book_course_screen.dart';

class FindFieldTab extends ConsumerWidget {
  const FindFieldTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            PrimaryCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FindCourseScreen()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.sports_soccer,color: Colors.white,),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Tìm sân",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
