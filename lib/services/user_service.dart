import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserService extends GetConnect {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    httpClient.baseUrl = 'https://bill-keep.herokuapp.com';

    httpClient.addRequestModifier((request) async {
      var token = await _firebaseAuth.currentUser.getIdToken(true);
      // Set the header
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });
    super.onInit();
  }

  Future<Map<String, dynamic>> getUser() async {
    final response = await get(
      '/api/user',
    );
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<Map<String, dynamic>> postUser(String name) async {
    print('Post user $name');
    final response = await post(
      "/api/user",
      {'name': name, 'phone': '+919400347835'},
    );
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      return response.body;
    }
  }
}
