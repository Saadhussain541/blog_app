import 'dart:async';

import 'package:blog_app/Screens/home.dart';
import 'package:blog_app/Screens/main_navbar.dart';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    Timer(const Duration(seconds: 5), ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const Navbar(),)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: heading_01(text: "BlogSpot.",size: 30,),
      ),
    );
  }
}
