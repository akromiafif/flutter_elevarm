import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.size,
    this.title,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
