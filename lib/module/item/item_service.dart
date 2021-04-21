import 'package:bill_keep/module/item/item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ItemService extends GetConnect {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    httpClient.baseUrl = 'https://bill-keep.herokuapp.com';

    httpClient.addRequestModifier((request) async {
      var token = await _firebaseAuth.currentUser.getIdToken(true);
      // Set the header
      request.headers['Authorization'] = "Bearer $token";
      print("REQUEST: ${request.files}");
      return request;
    });
    super.onInit();
  }

  Future<dynamic> getItem(boardId) async {
    final response = await get(
      '/api/item/$boardId',
    );
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<Map<String, dynamic>> postItem(Item newItem) async {
    final form = FormData(
      {
        'itemImageUrl': newItem.itemImageUrl != null
            ? MultipartFile(
                newItem.itemImageUrl,
                filename: newItem.name,
              )
            : null,
        'name': newItem.name,
        'description': newItem.description,
        'board_id': newItem.boardId,
        'labels': newItem.labels,
        'amount': newItem.amount,
        'itemDate': newItem.itemDate,
      },
    );
    final response = await post(
      "/api/item",
      form,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      print(response.status.code);
      return response.body;
    }
  }
}
