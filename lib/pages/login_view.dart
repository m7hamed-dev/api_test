import 'package:api_test/pages/provider_page.dart';
import 'package:api_test/providers/login_provider.dart';
import 'package:api_test/tools/push.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameProvider = context.read<LoginProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: _nameProvider.userController,
          ),
          IconButton(
            onPressed: () {
              _nameProvider.validation(_nameProvider.userController.text);
              Push().to(context, SecondPage());
            },
            icon: const Icon(
              Icons.login,
            ),
          )
        ],
      ),
    );
  }
}
