import 'package:api_test/pages/users/listview_users.dart';
import 'package:api_test/providers/get_users_provider.dart';
import 'package:api_test/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    //
    final _usersProvider = context.watch<GetUsersProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: _usersProvider.userList == null
          ? const CircularProgressIndicator()
          : _usersProvider.error.isNotEmpty
              ? MyErrorWidget(msgError: _usersProvider.error)
              : const ListViewUsers(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _usersProvider.userList.add(UserComplexModel(id: 'id', name: 'alla', username: 'username', email: ;, address: address, phone: phone, website: website, company: company));
          // Push().to(
          //   context,
          //   AddUserPage(
          //     userComplexModel: _usersProvider.userList![0],
          //     isUpdateUser: false,
          //   ),
          // );
        },
      ),
    );
  }
  // nullPinterExceptoin

}
