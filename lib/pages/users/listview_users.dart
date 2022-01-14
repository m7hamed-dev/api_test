import 'package:api_test/providers/get_users_provider.dart';
import 'package:api_test/tools/push.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../add_user_page.dart';

class ListViewUsers extends StatelessWidget {
  const ListViewUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usersProvider = context.watch<GetUsersProvider>();
    return ListView.separated(
      itemCount: _usersProvider.userList!.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        //
        return InkWell(
          onTap: () {
            _usersProvider.setUser(_usersProvider.userList![index]);
            Push().to(
              context,
              const AddUserPage(
                // userComplexModel: _usersProvider.userList![index],
                isUpdateUser: true,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _usersProvider.userList![index].id.toString(),
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(
                _usersProvider.userList![index].email,
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 30.0,
      ),
    );
  }
}
