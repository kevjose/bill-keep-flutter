import 'package:bill_keep/models/board_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BoardService extends GetConnect {
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

  Future<List<dynamic>> getBoard() async {
    final response = await get(
      '/api/board',
    );
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<Map<String, dynamic>> postBoard(Board newBoard) async {
    print('Post board ${newBoard.toMap()}');
    final form = FormData({
      'boardCoverImage': newBoard.boardCoverImage != null
          ? MultipartFile(
              newBoard.boardCoverImage,
              filename: newBoard.name,
            )
          : null,
      'name': newBoard.name,
      'description': newBoard.description,
      'color': newBoard.color,
      'collaborators': newBoard.collaborators,
    });
    final response = await post(
      "/api/board",
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
