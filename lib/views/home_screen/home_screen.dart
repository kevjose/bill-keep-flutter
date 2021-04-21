import 'package:bill_keep/controllers/controllers.dart';
import 'package:bill_keep/custom_widgets/custom_app_bar.dart';
import 'package:bill_keep/custom_widgets/custom_header.dart';

import 'package:bill_keep/utils/colors.dart';
import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/views/board_screen/board_screen.dart';
import 'package:bill_keep/views/home_screen/popular_courses_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Author> authors = <Author>[];
  List<AuthorText> subjects = <AuthorText>[];
  final AuthController _authController = Get.find();

  @override
  void initState() {
    super.initState();
    authors.add(
      Author(
        name: "Zomato order",
        designation: "Sharief bhai",
        path: "assets/icons/ic_sun.svg",
      ),
    );
    authors.add(
      Author(
        name: "Zomato order",
        designation: "Sharief bhai",
        path: "assets/icons/ic_sun.svg",
      ),
    );
    authors.add(
      Author(
        name: "Zomato order",
        designation: "Sharief bhai",
        path: "assets/icons/ic_sun.svg",
      ),
    );
    authors.add(
      Author(
        name: "Zomato order",
        designation: "Sharief bhai",
        path: "assets/icons/ic_sun.svg",
      ),
    );
    authors.add(
      Author(
        name: "Zomato order",
        designation: "Sharief bhai",
        path: "assets/icons/ic_sun.svg",
      ),
    );
    authors.add(
      Author(
        name: "Zomato order",
        designation: "Sharief bhai",
        path: "assets/icons/ic_sun.svg",
      ),
    );
    subjects.add(AuthorText(
        hour: "₹2000", subject: "Cooking", bgColor: lightening_yellow));
    subjects.add(
        AuthorText(hour: "₹2000", subject: "Electronics", bgColor: flamingo));
    subjects.add(
        AuthorText(hour: "₹2000", subject: "Cooking", bgColor: persian_blue));
    subjects.add(AuthorText(
        hour: "₹2000", subject: "Cooking", bgColor: carribean_green));
    subjects.add(
        AuthorText(hour: "₹2000", subject: "Cooking", bgColor: pink_salomn));
    subjects.add(AuthorText(
        hour: "₹2000", subject: "Cooking", bgColor: lightening_yellow));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        height: 200,
        child: CustomHeader(
          fgColor: wood_smoke,
          bgColor: white,
          color: wood_smoke,
          lineOneText: "Home",
          lineTwotext: "Board",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 230,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return PopularCourseAuthorItem(
                    author: subjects[index],
                  );
                },
                itemCount: subjects.length,
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24, top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HeaderText(
                        alignment: Alignment.centerLeft,
                        textAlign: TextAlign.left,
                        color: santas_gray_10,
                        weight: FontWeight.bold,
                        size: 15,
                        text: "All items",
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(24),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: authors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PopularCourseItem(
                        author: authors[index],
                      );
                    })
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(BoardScreen.routeName);
          } else if (index == 1) {
            _authController.signOutUser();
          }
        },
        selectedItemColor: wood_smoke,
        unselectedItemColor: trout,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(
          color: wood_smoke,
          opacity: 1,
        ),
        unselectedIconTheme: IconThemeData(
          color: trout,
          opacity: 0.6,
        ),
        selectedLabelStyle: TextStyle(
          color: wood_smoke,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: TextStyle(
          color: trout,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
