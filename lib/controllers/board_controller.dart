import 'package:bill_keep/helpers/helpers.dart';
import 'package:bill_keep/models/board_model.dart';
import 'package:bill_keep/services/board_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BoardController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final BoardService boardService;
  BoardController({this.boardService});
  final _loading = false.obs;
  final _processing = false.obs;

  // var boards = <Board>[].obs;
  final RxList<Board> boards = <Board>[].obs;

  bool get loading => _loading.value;
  bool get processing => _processing.value;

  void getMyBoard() async {
    _loading.value = true;
    try {
      final response = await boardService.getBoard();
      print('response boards: $response');
      boards(response
          .map(
            (x) => Board.fromMap(x),
          )
          .toList());
      print(boards);
    } catch (e) {
      boards([]);
    } finally {
      _loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getMyBoard();
  }

  void createBoard() async {
    if (formKey.currentState.validate()) {
      _processing.value = true;
      formKey.currentState.save();
      final Board newBoard = Board.fromMap(formKey.currentState.value);
      print('newboard ${formKey.currentState.value}');
      try {
        final response = await boardService.postBoard(newBoard);
        print("postBoard: $response");
        Helpers.showSnackbar(
          title: 'Success',
          message: 'Created board successfully',
        );
        Navigator.of(Get.context).pop();
        getMyBoard();
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
