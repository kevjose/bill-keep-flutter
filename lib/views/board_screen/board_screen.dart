import 'package:bill_keep/controllers/controllers.dart';
import 'package:bill_keep/custom_widgets/button_round_with_shadow.dart';
import 'package:bill_keep/custom_widgets/custom_app_bar.dart';
import 'package:bill_keep/custom_widgets/custom_header.dart';
import 'package:bill_keep/services/services.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:bill_keep/views/board_screen/add_board_screen.dart';
import 'package:bill_keep/views/board_screen/board_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardScreen extends StatelessWidget {
  static const routeName = 'board_screen';

  final UserController _userController = Get.find();
  final BoardController _boardController = Get.put(
    BoardController(
      boardService: Get.put(
        BoardService(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        height: 200,
        child: CustomHeader(
          lineOneText: "All",
          lineTwotext: "Boards",
          fgColor: wood_smoke,
          bgColor: white,
          color: wood_smoke,
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ButtonRoundWithShadow(
              size: 60,
              borderColor: wood_smoke,
              color: white,
              callback: () {
                _showAddBoardBottomSheet();
              },
              shadowColor: wood_smoke,
              iconPath: "assets/icons/ic_add.svg"),
        ),
      ),
      body: Obx(() {
        if (_boardController.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (_boardController.boards.length == 0) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Hey ${_userController.user.value.name}! Welcome to BillKeep',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: black,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n\nHere you can create new boards by clicking on the plus button at the bottom',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: flamingo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (BuildContext context, int index) {
                return BoardItem(
                  board: _boardController.boards[index],
                );
              },
              itemCount: _boardController.boards.length,
            );
          }
        }
      }),
    );
  }

  _showAddBoardBottomSheet() {
    showModalBottomSheet(
      context: Get.context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddBoardScreen();
      },
    );
  }
}
