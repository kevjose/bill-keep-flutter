import 'package:bill_keep/custom_widgets/custom_button.dart';
import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/models/board_model.dart';
import 'package:bill_keep/module/item/item_view.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardItem extends StatelessWidget {
  final Board board;

  BoardItem({this.board});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(24),
      decoration: ShapeDecoration(
        color: Color(board.color),
        shadows: [
          BoxShadow(
            color: wood_smoke,
            offset: Offset(0, 2),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          side: BorderSide(color: wood_smoke, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderText(
                color: white,
                text: board.name,
                size: 20,
                alignment: Alignment.centerLeft,
              ),
              board.description != null
                  ? HeaderText(
                      color: athen_gray,
                      text: board.description,
                      size: 12,
                      alignment: Alignment.centerLeft,
                      weight: FontWeight.w500,
                    )
                  : SizedBox(
                      height: 10,
                    ),
            ],
          ),
          CustomButton(
            height: 36,
            color: lightening_yellow,
            isSuffix: false,
            isPrefix: false,
            size: 90,
            text: "Open",
            textSize: 12,
            borderColor: wood_smoke,
            textColor: wood_smoke,
            callback: () {
              Get.toNamed(
                ItemViewPage.routeName,
                arguments: {
                  'board_id': board.id,
                  'name': board.name,
                },
              );
            },
            shadowColor: wood_smoke,
          )
        ],
      ),
    );
  }
}
