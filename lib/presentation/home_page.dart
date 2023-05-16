import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx_flutter/model/user/user.dart';
import 'package:mobx_flutter/presentation/custom/store_observer.dart';
import 'package:mobx_flutter/store/user_store.dart';

import '../global.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          StoreObserver(
            builder: (UserStore store,context) {
              return Column(
                children: [
                  Container(color: const Color(0xFF2DBD3A)),
                  Text(store.userList.length.toString()),
                  ElevatedButton(onPressed: () {
                    store.addUser(User(firstName: 'test', id: 2));
                  },
                  child: const Text('Add random user'),),
                ],
              );
            }
          ),
          //translated text
          Text(AppLocalizations.of(context)!.helloWorld)
        ],
      ),
    );
  }
}