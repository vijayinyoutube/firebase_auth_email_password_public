
import 'package:flutter/material.dart';

import '../Services/firebase_auth.dart';
import '../Widgets/general_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailID = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    emailID.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarClass(
        title: "Login page",
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextField("emailID", emailID, Icons.person, false),
            const HeightSpacer(myHeight: 15.00),
            buildTextField("Password", password, Icons.lock, true),
            const HeightSpacer(myHeight: 25.00),
            buildSubmitBtn(),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
          String labelText,
          TextEditingController textEditingController,
          IconData prefixIcons,
          bool isPassword) =>
      SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: TextFormField(
          obscureText: isPassword,
          controller: textEditingController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            prefixIcon: Icon(prefixIcons, color: Colors.blue),
            hintText: labelText,
            hintStyle: const TextStyle(color: Colors.blue),
            filled: true,
            fillColor: Colors.blue[50],
          ),
        ),
      );

  Widget buildSubmitBtn() => ElevatedButton(
      onPressed: () {
        Authentication().signUp(emailID.text, password.text);
      },
      child: const Text("Login"));
}
