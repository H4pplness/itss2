import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/models/sport-field.dart';

class SportFieldCard extends StatefulWidget {
  SportFieldCard({
    super.key,
    required this.field,
    this.backgroundColor = Colors.white,
    this.onTap
  });

  final SportField field;
  final Color backgroundColor;
  Function()? onTap;
  @override
  State<SportFieldCard> createState() => _SportFieldCardState();
}

class _SportFieldCardState extends State<SportFieldCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: widget.backgroundColor,
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: NetworkImage(widget.field.image!), // Path to your image
                  fit: BoxFit.cover, // Cover the entire container
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên sân ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 252, 122, 113),
                      ),
                    ),
                    Text(
                      'Địa chỉ ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 252, 122, 113),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.field.name!,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.field.location!,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
