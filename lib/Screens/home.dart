import 'dart:convert';

import 'package:blog_app/Screens/desc.dart';
import 'package:blog_app/Screens/list.dart';
import 'package:blog_app/Widgets/screen_widgets,dart.dart';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../Widgets/Api_Services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<void> _handlerefresh() async {
    setState(() {

    });
    return await Future.delayed(Duration(seconds: 2));
  }

  List image = [
      "https://d2tyltutevw8th.cloudfront.net/media/image/tech-countries-1200-1651693379.jpg",
      "https://iq-laboratory.com/wp-content/uploads/2021/04/laboratory-design.jpg",
      "https://images.unsplash.com/photo-1558152761-aee570eb5cb0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fEZhcm0lMjBBbmltYWxzfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1543352634-99a5d50ae78e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGZvb2QlMjBmbGF0JTIwbGF5fGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      "https://media.wired.com/photos/62feb60bcea7c0581e825cb0/master/w_2560%2Cc_limit/Fate-of-Game-Preservation-Games-GettyImages-1170073827.jpg",
      "https://images.unsplash.com/photo-1551524559-8af4e6624178?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fFNwb3J0c3xlbnwwfDB8MHx8&auto=format&fit=crop&w=600&q=60"];

  List Category = ["Technology","Science","Health","Food","Game","Sports"];

  List l = ["1","2","3","4","5"];

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
                      heading_01(text: "New Blogs", size: 20),
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

                FutureBuilder(
                  future: Api_Services.limit(),
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

                          return CarouselSlider.builder(
                            itemBuilder: (context, index, realIndex) {
                              String id = '${fetch[index]["blog_id"]}';
                              String title = '${fetch[index]["blog_title"]}';
                              String category = '${fetch[index]["blog_category"]}';
                              String views = '${fetch[index]["blog_views"]}';
                              var v = int.parse(views);
                              String desc = '${fetch[index]['blog_desc']}';
                              String image = '${fetch[index]['blog_image']}';
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Description(id: id,cat: category,),));
                                  var n = int.parse(views);
                                  var add = n+=1;
                                  String viewup = add.toString();
                                  print(n);
                                  Api_Services.update(id, image, title, desc, category, viewup);
                                },
                                child: slider_widget(
                                  image: '${fetch[index]["blog_image"]}',
                                  title: '${fetch[index]["blog_title"]}',
                                  cat:  '${fetch[index]["blog_category"]}',
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
                                ),
                              );
                            },
                            options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlayAnimationDuration:
                                const Duration(milliseconds: 2000),
                                autoPlay: true,
                                scrollDirection: Axis.horizontal,
                                autoPlayCurve: Curves.easeInOutCubic,
                                height: 280),
                            itemCount: l.length,
                          );
                        }

                        return Container();
                        }
                      ),

                //Category Heading
                Container(
                  margin: EdgeInsets.only(left: 14),
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      heading_01(text: "Categories", size: 20),
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

                FutureBuilder(
                  future: null,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          return GestureDetector(
                            onTap: (){
                              showDialog<void>(
                                context: context,
                                useSafeArea: false,
                                barrierColor: Colors.black.withOpacity(0.8),
                                // false = user must tap button, true = tap outside dialog
                                builder: (BuildContext dialogContext) {
                                  return FutureBuilder(
                                      future: Api_Services.cateegory(Category[index]),
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
                                                child: list_blogs_w(
                                                    image: image,
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
                                      });
                                },
                              );
                            },
                            child: category_carousel(
                              image: '${image[index]}',
                              cat: '${Category[index]}',
                            ),
                          );
                        },
                        options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlayAnimationDuration:
                            const Duration(milliseconds: 2000),
                            autoPlay: true,
                            scrollDirection: Axis.vertical,
                            autoPlayCurve: Curves.easeInOutCubic,
                            enlargeCenterPage: true,
                            height: 180),
                        itemCount: Category.length,
                      );
                    },
                ),



                SizedBox(height: 10),
                //Category Heading
                Container(
                  margin: EdgeInsets.only(left: 14,top: 10),
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      heading_01(text: "Top Blogs", size: 20),
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

                FutureBuilder(
                    future: Api_Services.top(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: heading_01(text: "Something went Wrong", size: 12));
                      }

                      if (snapshot.hasData) {

                        Map map = jsonDecode(snapshot.data);
                        List limit = map["data"];

                        return ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: limit.length,
                          itemBuilder: (context, index) {
                            String id = '${limit[index]["blog_id"]}';
                            String title = '${limit[index]["blog_title"]}';
                            String category = '${limit[index]["blog_category"]}';
                            String views = '${limit[index]["blog_views"]}';
                            var v = int.parse(views);
                            String desc = '${limit[index]['blog_desc']}';
                            String image = '${limit[index]['blog_image']}';
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Description(id:id,cat: category,),));
                                var n = int.parse(views);
                                var add = n+=1;
                                String viewup = add.toString();
                                Api_Services.update(id, image, title, desc, category, viewup);
                              },
                              child: list_blogs(
                                  image: image,
                                  title: title,
                                  cat: category,
                                  views: (v < 1000)?views:(v <= 1000)?'1k':(v<=1100)?'1.1K':(v<=1200)?'1.2K':
                                  (v<=1300)?'1.3K':(v<=1400)?'1.4K':(v<=1500)?'1.5K':(v<=1600)?'1.6K'
                                      :(v<=1700)?'1.7K':(v<=1800)?'1.8K':(v<=1900)?'1.9K':(v<=2000)?'2K':
                                  (v<=2100)?'2.1K':(v<=2200)?'2.2K':(v<=2300)?'2.3K':(v<=2400)?'2.4K'
                                      :(v<=2500)?'2.5K':(v<=2600)?'2.6K':(v<=2700)?'2.7K':(v<=2800)?'2.8K':
                                  (v<=2900)?'2.9K':(v<=3000)?'3K':(v<=3100)?'3.1K':(v<=3200)?'3.2K':
                                  (v<=3300)?'3.3K':(v<=3400)?'3.4K':(v<=3500)?'3.5K':(v<=3600)?'3.6K':
                                  (v<=3700)?'3.7K':(v<=3800)?'3.8K':(v<=3900)?'3.9K':(v<=4000)?'4K':
                                  (v<=4100)?'4.1K':(v<=4200)?'4.2K':(v<=4300)?'4.3K':(v<=4400)?'4.4K'
                                      :(v<=4500)?'4.5K':(v<=4600)?'4.6K':(v<=4700)?'4.7K':(v<=4800)?'4.8K':
                                  (v<=4900)?'4.9K':(v<=5000)?'5K':'5k+',
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
        ),
      ),);
  }
}


