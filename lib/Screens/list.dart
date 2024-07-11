import 'dart:convert';

import 'package:blog_app/Screens/desc.dart';
import 'package:blog_app/Widgets/Api_Services.dart';
import 'package:blog_app/Widgets/screen_widgets,dart.dart';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'main_navbar.dart';

class List_Screen extends StatefulWidget {
  const List_Screen({Key? key}) : super(key: key);

  @override
  State<List_Screen> createState() => _List_ScreenState();
}

class _List_ScreenState extends State<List_Screen> {

  Future<void> _handlerefresh() async{
    setState(() {

    });
    return await Future.delayed(Duration(seconds: 2));
  }

  List cat = ["All","Technology","Science","Health","Food","Game","Sports"];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LiquidPullToRefresh(
          onRefresh: _handlerefresh,
          color: Colors.transparent,
          height: 150,
          showChildOpacityTransition: false,
          animSpeedFactor: 2,
          backgroundColor: Color(0xFF066df8),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                //Main Heading
                Container(
                  margin: EdgeInsets.only(left: 14,top: 10),
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      heading_01(text: "Discover Blogs", size: 20),
                      Container(
                        width: 60,
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: cat.length,
                          itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              curve: decelerateEasing,
                              duration: Duration(milliseconds: 400),
                              margin: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: current==index? Colors.grey.shade400:Colors.transparent,
                                ),
                                borderRadius: current==index?BorderRadius.circular(20):BorderRadius.circular(4),
                              ),
                              child: Center(child: heading_01(text: cat[index], size: 14)),
                            ),
                          );
                        },),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: cat[current]=="All"?Api_Services.fetch():Api_Services.cateegory(cat[current]),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (snapshot.hasError) {
                              return Center(child: heading_01(text: "Something went Wrong", size: 12));
                            }

                            if (snapshot.hasData) {

                              Map map = jsonDecode(snapshot.data);
                              List fetch = map["data"];

                              return ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: fetch.length,
                                itemBuilder: (context, index) {
                                  String id = '${fetch[index]["blog_id"]}';
                                  String title = '${fetch[index]["blog_title"]}';
                                  String category = '${fetch[index]["blog_category"]}';
                                  String views = '${fetch[index]["blog_views"]}';
                                  var v = int.parse(views);
                                  String desc = '${fetch[index]['blog_desc']}';
                                  String image = '${fetch[index]['blog_image']}';
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Description(id:id,cat: category,),));
                                      var n = int.parse(views);
                                      var add = n+=1;
                                      String viewup = add.toString();
                                      Api_Services.update(id, image, title, desc, category, viewup);
                                      },
                                    child: list_blogs(image: '${fetch[index]["blog_image"]}',
                                        title: title,
                                        cat: category,
                                        views: (v < 1000)?views:(v == 1000)?'1k':(v<1100)?'1K':(v<1200)?'1.1K':
                                        (v<1300)?'1.2K':(v<1400)?'1.3K':(v<1500)?'1.4K':(v<1600)?'1.5K'
                                            :(v<1700)?'1.6K':(v<1800)?'1.7K':(v<1900)?'1.8K':(v<2000)?'1.9K':
                                        (v<2100)?'2K':(v<2200)?'2.1K':(v<2300)?'2.2K':(v<2400)?'2.3K'
                                            :(v<2500)?'2.4K':(v<2600)?'2.5K':(v<2700)?'2.6K':(v<2800)?'2.7K':
                                        (v<2900)?'2.8K':(v<3000)?'2.9K':(v<3100)?'3K':(v<3200)?'3.1K':
                                        (v<3300)?'3.2K':(v<3400)?'3.3K':(v<3500)?'3.4K':(v<3600)?'3.5K':
                                        (v<3700)?'3.6K':(v<3800)?'3.7K':(v<3900)?'3.8K':(v<4000)?'3.9K':
                                        (v<4100)?'4K':(v<4200)?'4.1K':(v<4300)?'4.2K':(v<4400)?'4.3K'
                                            :(v<4500)?'4.4K':(v<4600)?'4.5K':(v<4700)?'4.6K':(v<4800)?'4.7K':
                                        (v<4900)?'4.8K':(v<5000)?'4.9K':'5k+',
                                        icon: category=="Technology"?Iconsax.hierarchy_2:category=="Science"?Iconsax.glass:
                                    category=="Health"?Iconsax.health:category=="Food"?Iconsax.coffee:category=="Game"?
                                    Iconsax.game:Iconsax.medal_star),
                                  );
                                },);
                            }
                            return Container();
                          })
                    ],
                  ),
                ),

                // FutureBuilder(
                //   future: Api_Services.fetch(),
                //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                //
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return Center(child: CircularProgressIndicator());
                //     }
                //
                //     if (snapshot.hasError) {
                //       return Center(child: heading_01(text: "Something went Wrong", size: 12));
                //     }
                //
                //     if (snapshot.hasData) {
                //
                //       Map map = jsonDecode(snapshot.data);
                //       List fetch = map["data"];
                //
                //       return ListView.builder(
                //         physics: const ScrollPhysics(),
                //         shrinkWrap: true,
                //         scrollDirection: Axis.vertical,
                //         itemCount: fetch.length,
                //         itemBuilder: (context, index) {
                //           String id = '${fetch[index]["blog_id"]}';
                //           return GestureDetector(
                //             onTap: (){
                //               Navigator.push(context, MaterialPageRoute(builder: (context) => Description(id:id),));
                //             },
                //             child: list_blogs(image: '${fetch[index]["blog_image"]}',
                //                 title: '${fetch[index]["blog_title"]}',
                //                 cat: '${fetch[index]["blog_category"]}',
                //                 views:'${fetch[index]["blog_views"]}'),
                //           );
                //         },);
                //     }
                //     return Container();
                //   })
            ],
            ),
          ),
        ),
      )
    );
  }
}

