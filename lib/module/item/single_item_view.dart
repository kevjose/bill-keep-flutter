import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/module/item/item_model.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleLabelView extends StatelessWidget {
  final Item item;

  SingleLabelView({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: ShapeDecoration(
        color: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: [
                CircleAvatar(
                  // backgroundImage: NetworkImage(item.imageUrl),
                  child: Text(
                    item.name[0].toUpperCase(),
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 21,
                      color: wood_smoke,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "${item.description != null ? item.description : 'N/A'}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: trout, fontWeight: FontWeight.w500, fontSize: 15),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderText(
                  text: "₹ ${item.amount}",
                  size: 17,
                  weight: FontWeight.w800,
                  textAlign: TextAlign.center,
                  color: santas_gray_10,
                  alignment: Alignment.center,
                ),
                HeaderText(
                  text: "",
                  size: 17,
                  weight: FontWeight.w800,
                  textAlign: TextAlign.center,
                  color: santas_gray_10,
                  alignment: Alignment.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SingleItemView extends StatelessWidget {
  final Label label;

  SingleItemView({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 144,
            height: 160,
            decoration: ShapeDecoration(
                color: ([flamingo, persian_blue, black]..shuffle()).first,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: wood_smoke, width: 2))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₹ ${label.total}",
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Count: ${label.count}",
                    style: TextStyle(
                      fontSize: 15,
                      color: selago,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              label.id,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: wood_smoke,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
