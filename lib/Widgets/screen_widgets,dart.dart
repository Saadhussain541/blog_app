import 'dart:convert';

import 'package:blog_app/Screens/list.dart';
import 'package:blog_app/Widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../Screens/desc.dart';
import 'Api_Services.dart';

class slider_widget extends StatelessWidget {

  String image;
  String title;
  String cat;
  String views;


  slider_widget({required this.image, required this.title, required this.cat, required this.views});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Image Container
        Container(
          width: double.infinity,
          height: 170,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                image: NetworkImage(image),
                fit: BoxFit.cover
            ),
          ),
        ),
        // Text Container
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              heading_01(text: title, size: 16),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(cat=="Technology"? Iconsax.hierarchy_2: cat=="Science"? Iconsax.glass: cat=="Health"? Iconsax.health:
                          cat=="Food"? Iconsax.coffee: cat=="Game"? Iconsax.game: Iconsax.medal_star ,size: 12,color: Colors.grey.shade500,),
                          SizedBox(width: 4,),
                          Title_01(text: cat, size: 12),
                        ],
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.remove_red_eye_outlined,size: 12,color: Colors.grey.shade500,),
                          SizedBox(width: 4,),
                          Title_01(text: views, size: 12),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class category_carousel extends StatelessWidget {

  String image;
  String cat;


  category_carousel({required this.image, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
            image: NetworkImage(image),
            fit: BoxFit.cover
        ),
      ),
      child: Container(
          margin: EdgeInsets.only(left: 16,top: 130),
          child: heading_01_w(text: cat,size: 16,)),
    );
  }
}

class list_blogs extends StatelessWidget {

  String image;
  String title;
  String cat;
  String views;
  IconData icon;


  list_blogs({required this.image, required this.title, required this.cat, required this.views, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Main Container
        Container(
          margin: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400,width: 1,style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Image Container
            Container(
              margin:EdgeInsets.only(left: 18,top: 14),
              width: 80,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
            ),

            SizedBox(
              width: 8,
            ),
            // Title, Category and Views Container
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 220,
                    child: heading_01(text: title, size: 16)),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(icon,size: 12,color: Colors.grey.shade500,),
                            SizedBox(width: 4,),
                            Title_01(text: cat, size: 12),
                          ],
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.remove_red_eye_outlined,size: 12,color: Colors.grey.shade500,),
                            SizedBox(width: 4,),
                            Title_01(text: views, size: 12),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ],
        )
        // image Container

      ],
    );
  }
}

class list_blogs_w extends StatelessWidget {

  String image;
  String title;
  String cat;
  String views;
  IconData icon;


  list_blogs_w({required this.image, required this.title, required this.cat, required this.views, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Main Container
        Container(
          margin: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400,width: 1,style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Image Container
            Container(
              margin:EdgeInsets.only(left: 18,top: 14),
              width: 80,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
            ),

            SizedBox(
              width: 8,
            ),
            // Title, Category and Views Container
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 220,
                    child: heading_01_w(text: title, size: 16)),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(icon,size: 12,color: Colors.grey.shade500,),
                            SizedBox(width: 4,),
                            Title_01(text: cat, size: 12),
                          ],
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.remove_red_eye_outlined,size: 12,color: Colors.grey.shade500,),
                            SizedBox(width: 4,),
                            Title_01(text: views, size: 12),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ],
        )
        // image Container

      ],
    );
  }
}

class description_widget extends StatelessWidget {

  String title;
  String image;
  String cat;
  String view;
  String desc;


  description_widget({required this.title, required this.image, required this.cat, required this.view, required this.desc});

  @override
  Widget build(BuildContext context) {
    IconData icon = Iconsax.heart_add;
    return Stack(
      children: <Widget>[
        // Image Container
        Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          width: double.infinity,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                image: NetworkImage(image),
                fit: BoxFit.cover
            ),
          ),
        ),

        //back button
        Container(
          margin: EdgeInsets.only(left: 20,top: 30),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade400,width: 1,style: BorderStyle.solid),
          ),
          child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Center(child: Icon(Icons.arrow_back,color: Colors.grey.shade400,),)),
        ),

        //Title and Category with Views Container
        Container(
          margin: EdgeInsets.only(left: 20,top: 150),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              heading_01_w(text: title, size: 16),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(cat=="Technology"? Iconsax.hierarchy_2: cat=="Science"? Iconsax.glass: cat=="Health"? Iconsax.health:
                          cat=="Food"? Iconsax.coffee: cat=="Game"? Iconsax.game: Iconsax.medal_star,size: 12,color: Colors.grey.shade500,),
                          SizedBox(width: 4,),
                          Title_01(text: cat, size: 12),
                        ],
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.remove_red_eye_outlined,size: 12,color: Colors.grey.shade500,),
                          SizedBox(width: 4,),
                          Title_01(text: view, size: 12),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),

        //Report and Share Container
        Container(
          margin: EdgeInsets.only(top: 240),
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 4),
            child: GestureDetector(
              onTap: (){
                icon = Iconsax.heart_tick;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wishlist Coming Soon...")));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(icon,color: Colors.white,size: 16,),
                  SizedBox(width: 6,),
                  heading_01_w(text: "Add to Wishlist", size: 12),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 10,),

        //Description Container
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 300),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            width: double.infinity,
            height: 380,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(child:SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: (Desc_01(
                    text: desc,
                    size: 14,
                  )),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class search_page extends StatelessWidget {

  TextEditingController controller;
  bool isbuttonEnabled;

  search_page({required this.controller, required this.isbuttonEnabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
              width: double.infinity,
              height: 160,
              child: Center(child: Lottie.asset("assets/icon/search_animation.json"),),
            ),

            Container(
                margin: EdgeInsets.only(top: 130,left: 85),
                child: heading_01(text: "Search your desire blog!", size: 16)),
          ],
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: 4,horizontal: 40),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff066df8),style: BorderStyle.solid),borderRadius: BorderRadius.circular(40)),
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              labelText: "Search by title",
            ),
          ),
        ),

        SizedBox(height: 10,),

        heading_01(text: "* Results may vary it may be differ from what you search *", size: 8),

        SizedBox(height: 30,),

        GestureDetector(
          onTap: isbuttonEnabled?(){
            if (controller.text=="") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Empty")));
            }
            if (controller.text != "") {
              showDialog<void>(
                context: context,
                useSafeArea: false,
                barrierColor: Colors.black.withOpacity(0.8),
                // false = user must tap button, true = tap outside dialog
                builder: (BuildContext dialogContext) {
                  return FutureBuilder(
                      future: Api_Services.search(controller.text),
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
            }
          }:null,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: isbuttonEnabled?1.0:0.5,
            curve: Curves.easeInOutCubicEmphasized,
            child: Container(
              width: 100,
              height: 34,
              decoration: BoxDecoration(
                  color: isbuttonEnabled?Color(0xff066df8):Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400.withOpacity(0.2),
                        spreadRadius: 0.4,
                        blurRadius: 10
                    )
                  ]
              ),
              child: Center(child: isbuttonEnabled?heading_01_w(text: "Search", size: 14):heading_01_w(text: "...", size: 14),),
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}




