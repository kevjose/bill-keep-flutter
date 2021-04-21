import 'package:bill_keep/controllers/controllers.dart';
import 'package:bill_keep/custom_widgets/button_solid_with_icon.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/views/login_screen/login_input_mobile_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';

  final AuthController _authController = Get.find();

  handleFormSubmit() async {
    if (_authController.verificationCodeSent.value == false) {
      print('handleFormSubmit: ${_authController.mobileNumber.value}');
      await _authController
          .submitPhoneNumber(_authController.mobileNumber.value);
    } else if (_authController.verificationCodeSent.value == true) {
      await _authController.loginWithPhone(_authController.pins.join());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: athens,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/ic_sun.svg",
                    height: 120,
                    width: 120,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Welcome to BillKeep',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HeaderText(
                    text: "Login",
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Obx(
                    () => _authController.verificationCodeSent.value == false
                        ? LoginMobileText(
                            text: "Mobile number",
                            iconPath: "assets/icons/user.svg",
                            onChangedCb: (text) {
                              _authController.mobileNumber.value = text;
                            })
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: "${_authController.mobileNumber.value}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: black,
                                ),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => _authController.verificationCodeSent.value == false
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'Click login to get otp',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: black,
                                ),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'Enter otp to login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: black,
                                ),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => _authController.verificationCodeSent.value == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              6,
                              (index) => Container(
                                width: 56,
                                height: 56,
                                alignment: Alignment.center,
                                child: TextField(
                                  maxLength: 1,
                                  onChanged: (String text) {
                                    if (text.isNotEmpty) {
                                      FocusScope.of(context).nextFocus();
                                      _authController.pins[index] = text;
                                    } else if (text.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: wood_smoke,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      color: wood_smoke,
                                    ),
                                    hintText: "_",
                                    contentPadding: EdgeInsets.all(2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(width: 2, color: black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(width: 2, color: black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(width: 2, color: black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(width: 2, color: black),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Obx(
                    () => _authController.loading.value == true
                        ? ButtonPlainWithIcon(
                            color: wood_smoke,
                            textColor: white,
                            iconPath: "assets/icons/arrow_next.svg",
                            isPrefix: false,
                            isSuffix: true,
                            text: 'Processing...',
                            callback: () {},
                          )
                        : ButtonPlainWithIcon(
                            color: wood_smoke,
                            textColor: white,
                            iconPath: "assets/icons/arrow_next.svg",
                            isPrefix: false,
                            isSuffix: true,
                            text: 'Login',
                            callback: () {
                              handleFormSubmit();
                            },
                          ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
