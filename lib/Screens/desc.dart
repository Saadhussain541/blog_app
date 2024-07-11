import 'dart:convert';

import 'package:blog_app/Screens/list.dart';
import 'package:blog_app/Widgets/Api_Services.dart';
import 'package:blog_app/Widgets/screen_widgets,dart.dart';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class Description extends StatefulWidget {

  String id;
  String cat;
  Description({required this.id,required this.cat});

  @override
  State<Description> createState() => _DescriptionState(id: id,cat: cat);
}

class _DescriptionState extends State<Description> {

  String id;
  String cat;
  _DescriptionState({required this.id,required this.cat});

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

              FutureBuilder(
                  future: Api_Services.description(id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: heading_01(text: "Something went Wrong", size: 12));
                    }

                    if (snapshot.hasData) {

                      Map map = jsonDecode(snapshot.data);
                          String views = '${map["data"]["blog_views"]}';
                          var v = int.parse(views);
                        return description_widget(
                          image: '${map["data"]["blog_image"]}',
                          title: '${map["data"]["blog_title"]}',
                          cat: '${map["data"]["blog_category"]}',
                          view: (v < 1000)?views:(v == 1000)?'1k':(v<1100)?'1K':(v<1200)?'1.1K':
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
                          desc: '${map["data"]["blog_desc"]}',);
                    }

                    return Container();
                  }),

              Container(
                margin: EdgeInsets.only(left: 14,top: 10),
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    heading_01(text: "Similar Blogs", size: 20),
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
                  future: Api_Services.cateegory(cat),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {

                      Map map = jsonDecode(snapshot.data);
                      List similar = map["data"];
                      return ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          String id = '${similar[index]["blog_id"]}';
                          String category = '${similar[index]["blog_category"]}';
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Description(id: id,cat: category,),));
                            },
                            child: list_blogs(
                                image: '${similar[index]["blog_image"]}',
                                title: '${similar[index]["blog_title"]}',
                                cat: category,
                                views: '${similar[index]["blog_views"]}',
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
    );
  }
}


