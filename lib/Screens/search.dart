import 'package:blog_app/Widgets/screen_widgets,dart.dart';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main_navbar.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {

  final _mytext = TextEditingController();
  bool isbuttonEnabled = false;
 // animated Search Button
  void _textlistener(){
    setState(() {
      isbuttonEnabled = _mytext.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mytext.addListener(_textlistener);
  }
  @override
  void dispose() {
    _mytext.removeListener(_textlistener);
    _mytext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(child: search_page(controller: _mytext,isbuttonEnabled:isbuttonEnabled,))),
      )
    );
  }
}

