import 'package:flutter/material.dart';
import 'package:api_test/constants/constant.dart';
import 'package:api_test/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetUsersProvider extends ChangeNotifier {
  late UserComplexModel myUserComplexModel;
  //
  void setUser(UserComplexModel userComplexModel) {
    myUserComplexModel = userComplexModel;
    notifyListeners();
  }

  GetUsersProvider() {
    getUsers();
  }
  List<UserComplexModel>? userList;
  String error = '';
  //
  Future<void> getUsers() async {
    try {
      var _respose = await http.get(Uri.parse(photosUrl));
      debugPrint('code ${_respose.statusCode}');

      if (_respose.statusCode == 200) {
        // for (UserComplexModel item in userComplexModelFromJson(_respose.body)) {
        //   _userList.add(item);
        // }
        userList = userComplexModelFromJson(_respose.body);
        notifyListeners();
        //
      } else if (_respose.statusCode == 404) {
        error = 'Error on url';
        userList = [];
        notifyListeners();
      }
    } catch (e) {
      error = 'Error !! $e';
    }
  }
}
