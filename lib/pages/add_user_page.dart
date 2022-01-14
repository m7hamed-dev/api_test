import 'dart:convert';
import 'package:api_test/constants/constant.dart';
import 'package:api_test/models/user_model.dart';
import 'package:api_test/providers/get_users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:provider/src/provider.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({
    Key? key,
    required this.isUpdateUser,
  }) : super(key: key);
  //
  final bool isUpdateUser;
  //
  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  //
  TextEditingController _IDController = TextEditingController();

  //

  @override
  void initState() {
    super.initState();

    // if (widget.isUpdateUser) {
    //   _IDController.text = widget.userComplexModel.id.toString();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final _usersProvider = context.watch<GetUsersProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(_usersProvider.myUserComplexModel.id.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _input(
              'id',
              (value) {
                // id = value;
                setState(() {});
              },
              textEditingController: _IDController,
            ),
            const SizedBox(height: 10.0),
            _input('title', (value) {
              // title = value;
              setState(() {});
            }),
            const SizedBox(height: 10.0),
            _input('body', (value) {
              // body = value;
              setState(() {});
            }),
            const SizedBox(height: 10.0),
            IconButton(
              onPressed: () {
                final Map<String, dynamic> _map = {
                  'userId': 'id',
                  'id': 'id',
                  'title': 'title',
                  'body': 'body',
                };
                _createUser(_map);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  TextFormField _input(
    String txt,
    Function(String)? onChanged, {
    TextEditingController? textEditingController,
  }) {
    return TextFormField(
      autofocus: false,
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        labelText: txt,
      ),
    );
  }

  void _createUser(Map<String, dynamic> body) async {
    EasyLoading.show(status: 'loading ...');
    try {
      final res = await http.put(
        Uri.parse(updateUserUrl),
        body: json.encode(body),
      );
      debugPrint('res.statusCode = ${res.statusCode}');
      if (res.statusCode == 200) {
        EasyLoading.show(status: res.body);
        debugPrint('res = ${res.statusCode}');
      } else {
        EasyLoading.dismiss();
        debugPrint('error');
      }
    } catch (e) {
      EasyLoading.showError(
        e.toString(),
        duration: const Duration(seconds: 20),
        dismissOnTap: true,
      );
      debugPrint('error');
    }
  }
}
