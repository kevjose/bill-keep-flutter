import 'package:bill_keep/helpers/helpers.dart';
import 'package:bill_keep/module/item/item_model.dart';
import 'package:bill_keep/module/item/item_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ItemController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final ItemService itemService;
  ItemController({this.itemService});
  final _loading = false.obs;
  final _processing = false.obs;
  final RxList<Item> items = <Item>[].obs;
  final RxList<Label> labels = <Label>[].obs;
  final String boardId = Get.arguments['board_id'];

  bool get loading => _loading.value;
  bool get processing => _processing.value;

  void getBoardItem(boardId) async {
    _loading.value = true;
    try {
      final response = await itemService.getItem(boardId);
      print("response $response");
      items(
        response['items']
            .map<Item>(
              (x) => Item.fromMap(x),
            )
            .toList(),
      );
      labels(
        response['labels']
            .map<Label>(
              (x) => Label.fromMap(x),
            )
            .toList(),
      );
    } catch (e) {
      print('Error $e');
      items([]);
      labels([]);
    } finally {
      _loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getBoardItem(boardId);
  }

  void createItem() async {
    if (formKey.currentState.validate()) {
      _processing.value = true;
      formKey.currentState.save();
      final Item newItem = Item.fromMap(
        {
          ...formKey.currentState.value,
          ...{
            'board_id': boardId,
          },
        },
      );
      print('newItem ${formKey.currentState.value}');
      try {
        final response = await itemService.postItem(newItem);
        print("postItem: $response");
        Helpers.showSnackbar(
          title: 'Success',
          message: 'Created items successfully',
        );
        Navigator.of(Get.context).pop();
        getBoardItem(boardId);
      } catch (e) {
        Helpers.showSnackbar(
          title: 'Error',
          message: 'Something went wrong please try again',
        );
      } finally {
        _processing.value = false;
      }
    } else {
      print('Validation failed');
    }
  }
}
