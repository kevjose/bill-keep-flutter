import 'package:bill_keep/models/user_model.dart';
import 'package:bill_keep/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  final UserService userService;
  UserController({this.userService});
  var user = User().obs;
  var isLoading = false.obs;

  TextEditingController nameEditingContoller = TextEditingController();
  void getUser() {
    userService.getUser().then((resp) {
      change(resp, status: RxStatus.success());
      if (resp != null) {
        user.value = User.fromMap(resp);
      }
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void postUser(String name) {
    isLoading.value = true;
    UserService().postUser(name).then((resp) {
      change(resp, status: RxStatus.success());
      if (resp != null) {
        user.value = User.fromMap(resp);
      }
      isLoading.value = false;
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
      isLoading.value = false;
    });
  }
}
