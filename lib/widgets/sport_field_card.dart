import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itss2/models/sport-field.dart';

class SportFieldCard extends StatelessWidget {
  const SportFieldCard({
    super.key,
    required this.field,
  });

  final SportField field;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(field.image!), // Path to your image
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
                      field.name!,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      field.location!,
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
    );
  }
}
