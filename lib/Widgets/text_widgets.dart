import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class heading_01 extends StatelessWidget {

  String text;
  double size;


  heading_01({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis
      ),
    ),);
  }
}

class heading_01_w extends StatelessWidget {

  String text;
  double size;


  heading_01_w({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: size,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.fade
      ),
    ),);
  }
}

class heading_02 extends StatelessWidget {

  String text;
  double size;


  heading_02({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.fade
      ),
    ),);
  }
}

class Title_01 extends StatelessWidget {

  String text;
  double size;


  Title_01({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade500,
          overflow: TextOverflow.ellipsis,
      ),
    ),);
  }
}

class Title_01_w extends StatelessWidget {

  String text;
  double size;


  Title_01_w({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      ),
    ),);
  }
}

class Desc_01 extends StatelessWidget {

  String text;
  double size;


  Desc_01({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.fade,
      ),
    ),textAlign: TextAlign.left,);
  }
}