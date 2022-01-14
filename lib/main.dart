import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'pages/get_user_page.dart';
import 'pages/login_view.dart';
import 'pages/provider_page.dart';
import 'providers/counter_provider.dart';
import 'providers/get_users_provider.dart';
import 'providers/login_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // 1
        ChangeNotifierProvider<CounterProvider>(
          create: (_) => CounterProvider(),
        ),
        // 2
        ChangeNotifierProvider<ResCounterProvider>(
          create: (_) => ResCounterProvider(),
        ),
        // 3
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        // 4
        ChangeNotifierProvider<GetUsersProvider>(
          create: (_) => GetUsersProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserPage(),
      builder: EasyLoading.init(),
    );
  }
}
