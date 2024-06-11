import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itss2/widgets/atoms/cards/sport_type_card.dart';
import 'package:itss2/widgets/organisms/app_bars/none_title_appbar.dart';

class SportTypeScreen extends ConsumerWidget {
  const SportTypeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: NonTitleAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SportTypeCard(prefixIcon: Icon(Icons.sports_soccer,color: Colors.white,size: 30,),title: "Bóng đá",),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SportTypeCard(prefixIcon: Icon(Icons.sports_basketball,color: Colors.white,size: 30,),title: "Bóng rổ",),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SportTypeCard(prefixIcon: Icon(Icons.sports_tennis,color: Colors.white,size: 30,),title: "Cầu lông",),
          ),
        ],
      ),
    );
  }
}
