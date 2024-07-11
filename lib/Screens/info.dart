import 'dart:core';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';


class Info_Screen extends StatefulWidget {

  @override
  State<Info_Screen> createState() => _Info_ScreenState();
}
class _Info_ScreenState extends State<Info_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: 40,),

              Container(
                width: double.infinity,
                child: Center(child: heading_01(text: "BlogSpot.",size: 24)),
              ),
              Container(
                width: double.infinity,
                child: Center(child: Desc_01(text: "Version 1.0.0",size: 12)),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: heading_01(text: "About the App.",size: 14,),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: Desc_01(text: "BlogSpot is made for Demo purpose only. Data displayed in this application is taken from valid sources (i.e Google, Forbes, and local websites.",size: 12,),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: heading_01(text: "About Functionality of App.",size: 14,),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: Desc_01(text: "In BlogSpot App Data is fetched from our Live Restful API. Basic CRUD operations are done using another app linked with our Restful API.Restful API is available on request.",size: 12,),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: heading_01(text: "About App Design.",size: 14,),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: Desc_01(text: "I merged multiple design ideas to create design for BlogSpot App. Ideas source's includes (Pinterest, Dribble, Behance).Especially color theme of this app is based on 60-30-10 Color Rule to make it more Simple, Modern & Fresh.",size: 12,),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: heading_01(text: "About Developer.",size: 14,),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.GqGVPkLpUlSo5SmeDogUdwHaHa&pid=Api&P=0&h=220"),backgroundColor: Colors.grey.shade400,radius: 24),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        heading_01(text: "Saad Hussain", size: 14),
                        Desc_01(text: "Junior Flutter Developer", size: 12),
                        SizedBox(height: 4,),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: (){
                                  final Uri github = Uri.parse("https://github.com/saadhussain541");
                                  launchUrl(github);
                                },
                                child: CircleAvatar(backgroundImage: AssetImage("assets/icon/github.png"),backgroundColor: Colors.grey.shade400,radius: 12,)),
                            SizedBox(width: 6,),
                            GestureDetector(
                                onTap: (){
                                  final Uri linkedin = Uri.parse("https://www.linkedin.com/in/saad-hussain-9ab482223");
                                  launchUrl(linkedin);
                                },
                                child: CircleAvatar(backgroundImage: AssetImage("assets/icon/linkedin.png"),backgroundColor: Colors.grey.shade400,radius: 12,)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
