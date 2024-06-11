import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/atoms/cards/primary_card.dart';
import '../../book_course_screen/book_course_screen.dart';
import '../../book_player_screen/book_player_screen.dart';
import '../../find_course_screen/find_course_screen.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, ref) {
     return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}
