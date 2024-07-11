import 'package:blog_app/Screens/home.dart';
import 'package:blog_app/Screens/info.dart';
import 'package:blog_app/Screens/list.dart';
import 'package:blog_app/Screens/search.dart';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // page index shifter according to index
  int selected_page = 0;

  void _pageshifter(int index){
    setState(() {
      selected_page = index;
    });
  }

  final List<Widget> page = [
    Home(),
    List_Screen(),
    Search_Screen(),
    Info_Screen()
  ];

  //Connectivity Checker
  String conntectionstatus="";

  void updateconnectionstatus(connectivityResult){
    setState(() {
      if (connectivityResult==ConnectivityResult.wifi || connectivityResult==ConnectivityResult.mobile ||connectivityResult==ConnectivityResult.ethernet ) {
          conntectionstatus = 'Connected';
      }
      else{
        conntectionstatus = 'Disconnect';
      }
    });
  }

  Future<void> initconnectivity()async{
    final connectivityResult  = await Connectivity().checkConnectivity();
    updateconnectionstatus(connectivityResult);
    Connectivity().onConnectivityChanged.listen(updateconnectionstatus);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initconnectivity();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Close the application on back press
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: conntectionstatus=='Connected'?page[selected_page]:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Lottie.asset("assets/icon/wifi.json",repeat: false),),
            heading_01(text: "Internet Connection Lost...", size: 14),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Title_01(text: "Automatically reloaded on connection availability", size: 12))
          ],
        ),
        bottomNavigationBar: conntectionstatus=='Connected'? Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: GNav(
            tabBackgroundColor: Color(0xff066df8),
            activeColor: Color(0xfffcffff),
            gap: 6,
            iconSize: 18,
            textSize: 12,
            curve: Curves.easeInExpo,
            selectedIndex: selected_page,
            onTabChange: _pageshifter,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
            tabs: [
              GButton(
                  text: "Home",
                  icon: Iconsax.home_2),
              GButton(
                  text: "Discover",
                  icon: Iconsax.discover_1),
              GButton(
                  text: "Search",
                  icon: Iconsax.search_normal),
              GButton(
                  text: "About",
                  icon: Iconsax.info_circle),
            ],
          ),
        ):null,
      ),
    );
  }
}
