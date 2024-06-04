
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SportTypeCard extends StatelessWidget {
  Icon prefixIcon;
  String title;
  SportTypeCard({super.key,required this.prefixIcon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          prefixIcon,
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
