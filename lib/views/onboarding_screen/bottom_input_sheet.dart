import 'package:bill_keep/controllers/user_controller.dart';
import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomSheetInput extends StatelessWidget {
  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 500,
        color: Color(0xFF737373),
        // This line set the transparent background
        child: Container(
          height: 500,
          decoration: ShapeDecoration(
            color: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    HeaderText(
                      text: "Create Profile",
                      alignment: Alignment.centerLeft,
                      color: wood_smoke,
                      size: 21,
                      weight: FontWeight.bold,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          "assets/icons/close.svg",
                        ))
                  ],
                ),
              ),
              Container(
                height: 2,
                color: wood_smoke,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Creating profile for ${_userController.user.value.phone}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _userController.nameEditingContoller,
                  decoration: InputDecoration(
                    hintText: 'Enter name',
                    hintStyle: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: wood_smoke),
                    contentPadding: EdgeInsets.all(16),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: black),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: black),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: black),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: black),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      _userController
                          .postUser(_userController.nameEditingContoller.text);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Submit',
                            style: TextStyle(
                              color: flamingo,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Icon(
                            Icons.play_arrow_outlined,
                            color: flamingo,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
