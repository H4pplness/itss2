import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itss2/screens/book_player_screen/book_player_screen.dart';

import '../../../widgets/atoms/cards/primary_card.dart';
import '../../book_course_screen/book_course_screen.dart';

class BookPlayerTab extends ConsumerWidget {
  const BookPlayerTab({super.key});

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
                          builder: (context) => BookPlayerScreen()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.sports_soccer,color: Colors.white,),
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
          ],
        ),
      ),
    );
  }
}
