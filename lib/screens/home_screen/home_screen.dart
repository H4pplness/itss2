import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/screens/book_course_screen/book_course_screen.dart';
import 'package:itss2/screens/book_player_screen/book_player_screen.dart';
import 'package:itss2/screens/find_course_screen/find_course_screen.dart';
import 'package:itss2/screens/find_player_screen/find_player_screen.dart';
import 'package:itss2/screens/home_screen/tab_index/tab_index_notifier.dart';
import 'package:itss2/screens/home_screen/tabs/book_field.dart';
import 'package:itss2/screens/home_screen/tabs/book_player.dart';
import 'package:itss2/screens/home_screen/tabs/find_field.dart';
import 'package:itss2/screens/home_screen/tabs/home_tab.dart';
import 'package:itss2/widgets/atoms/cards/primary_card.dart';
import 'package:itss2/widgets/organisms/app_bars/home_page_appbar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<Widget> tabs =[
      HomeTab(),
      BookFieldTab(),
      BookPlayerTab(),
      FindFieldTab()
    ];

    final index = ref.watch(tabIndexNotifierProvider);

    return Scaffold(
        appBar: HomePageAppbar(),
        body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: index,
      onTap: (index) =>
          ref.read(tabIndexNotifierProvider.notifier).setIndex(index),
      backgroundColor: Theme.of(context).colorScheme.background,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).iconTheme.color,
      selectedFontSize: 12,
      selectedIconTheme: const IconThemeData(size: 27, opticalSize: 1),
      unselectedIconTheme: const IconThemeData(opticalSize: 1, size: 27),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.sports_soccer,
            ),
            label: "Đặt sân"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label : "Đặt đối"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label : "Tìm sân"
        ),
      ],
    )
    );
  }
}
