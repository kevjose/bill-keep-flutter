import 'package:bill_keep/custom_widgets/button_round_with_shadow.dart';
import 'package:bill_keep/custom_widgets/custom_app_bar.dart';
import 'package:bill_keep/custom_widgets/custom_header.dart';
import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/module/item/add_item_screen.dart';
import 'package:bill_keep/module/item/item_controller.dart';
import 'package:bill_keep/module/item/single_item_view.dart';

import 'package:bill_keep/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemViewPage extends StatelessWidget {
  final ItemController itemController = Get.find<ItemController>();
  static const routeName = 'item_screen';
  final dataArgs = Get.arguments;

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
          lineOneText: "Board",
          lineTwotext: dataArgs['name'],
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
      body: Stack(children: [
        SingleChildScrollView(
          child: Obx(
            () {
              if (itemController.loading == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (itemController.items.length == 0) {
                  return Container(
                    height: Get.size.height * 3 / 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '\n\nHere you can create new expense items by clicking on the plus button at the bottom',
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
                    ),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 230,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return SingleItemView(
                              label: itemController.labels[index],
                            );
                          },
                          itemCount: itemController.labels.length,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24, top: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                HeaderText(
                                  alignment: Alignment.centerLeft,
                                  textAlign: TextAlign.left,
                                  color: santas_gray_10,
                                  weight: FontWeight.bold,
                                  size: 15,
                                  text: "All Expenses",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: Get.size.height / 2,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(24),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: itemController.items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SingleLabelView(
                                  item: itemController.items[index],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }
              }
            },
          ),
        ),
        Positioned(
          right: 42,
          bottom: 150,
          child: ButtonRoundWithShadow(
            size: 60,
            iconPath: "assets/icons/close.svg",
            borderColor: black,
            shadowColor: black,
            color: white,
            callback: () {
              Get.back();
            },
          ),
        )
      ]),
    );
  }

  _showAddBoardBottomSheet() {
    showModalBottomSheet(
      context: Get.context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddItemScreen();
      },
    );
  }
}
