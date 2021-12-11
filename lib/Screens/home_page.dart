
import 'package:flutter/material.dart';

import '../Services/firebase_auth.dart';
import '../Widgets/general_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarClass(
        title: "Welcome",
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Authentication().signOut();
            },
            child: const Text("Logout")),
      ),
    );
  }
}
