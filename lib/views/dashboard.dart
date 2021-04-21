import 'package:bill_keep/controllers/controllers.dart';
import 'package:bill_keep/services/user_service.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:bill_keep/views/board_screen/board_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_screen/bottom_input_sheet.dart';

class Dashboard extends StatefulWidget {
  static const routeName = 'dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final AuthController _authController = Get.find();
  final UserController _userController = Get.put(
    UserController(
      userService: Get.put(UserService()),
    ),
  );
  final List<Widget> _childrenWidgets = [
    BoardScreen(),
    BoardScreen(),
    SizedBox(
      width: 200.0,
      height: 300.0,
      child: const Card(child: Text('Logging out')),
    )
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _authController.signOutUser();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _userController.isLoading.value == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _userController.obx((data) {
              print('data: $data,loading: ${_userController.isLoading.value}');
              if (data != null) {
                return Center(
                  child: _childrenWidgets.elementAt(_currentIndex),
                  // child:
                  //     Text('User for ${_userController.user.value.phone} found'),
                );
              } else {
                return Container(
                  color: white,
                  width: double.infinity,
                  height: Get.size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text:
                              'No profile found for ${_authController.user.phoneNumber}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          _showAddLabelBottomSheet();
                        },
                        icon: Icon(Icons.add_photo_alternate_outlined),
                        label: Text(
                          'Create profile',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: flamingo,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            })),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: wood_smoke,
        unselectedItemColor: trout,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(color: wood_smoke, opacity: 1),
        unselectedIconTheme: IconThemeData(color: trout, opacity: 0.6),
        selectedLabelStyle: TextStyle(
            color: wood_smoke, fontSize: 12, fontWeight: FontWeight.w800),
        unselectedLabelStyle:
            TextStyle(color: trout, fontSize: 12, fontWeight: FontWeight.w800),
      ),
    );
  }

  _showAddLabelBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheetInput();
      },
    );
  }
}
