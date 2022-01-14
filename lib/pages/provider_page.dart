import 'package:api_test/providers/counter_provider.dart';
import 'package:api_test/providers/login_provider.dart';
import 'package:api_test/tools/push.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild ...........');
    // watch = observalble
    final provider = context.watch<CounterProvider>();
    //
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(provider.counter.toString()),
          IconButton(
            onPressed: () {
              provider.add();
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          // TextFormField(
          //   controller: counterProvider.textEditingController,
          //   onChanged: (value) {
          //     counterProvider.onChange(value);
          //   },
          // ),
          // Center(
          //   child: Consumer<CounterProvider>(
          //     builder: (context, provider, _) {
          //       return Column(
          //         children: [
          //           Text(provider.counter.toString()),
          //           IconButton(
          //             onPressed: () {
          //               provider.add();
          //             },
          //             icon: const Icon(
          //               Icons.add,
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),

          IconButton(
            onPressed: () {
              Push().to(context, SecondPage());
            },
            icon: const Icon(
              Icons.view_agenda,
            ),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    final counterProvider = context.watch<CounterProvider>();
    final loginProvier = context.watch<LoginProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text("${loginProvier.name}")),
          // IconButton(
          //   onPressed: add,
          //   icon: const Icon(
          //     Icons.add,
          //   ),
          // )
        ],
      ),
    );
  }
}
