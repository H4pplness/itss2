import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteCard extends ConsumerStatefulWidget {
  String name;
  String startTime;
  String endTime;
  String date;
  Color? buttonColor;
  Function()? onPressed;
  InviteCard(
      {super.key,
      this.buttonColor,
      required this.name,
      required this.startTime,
      required this.endTime,
      required this.date,
      this.onPressed});

  @override
  ConsumerState createState() => _InviteCardState();
}

class _InviteCardState extends ConsumerState<InviteCard> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1))),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${widget.startTime}-${widget.endTime} ${widget.date}",
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500),
              )
            ],
          )),
          TextButton(
              onPressed: () {
                if (widget.onPressed != null && !clicked) {
                  widget.onPressed!();
                  setState(() {
                    clicked = true;
                  });
                }
              },
              child: Text(
                "Mời",
                style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color:
                        clicked ? Colors.grey : Theme.of(context).primaryColor),
              ))
        ],
      ),
    );
  }
}
