import 'package:appwrite/appwrite.dart';
import 'package:auth_app/presentation/routes.dart';
import 'package:flutter/material.dart';

import '../model/services/api_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter AppWrite'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              "Přihlášení",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 20.0),
            textFieldBuilder(_email, "Email", false),
            const SizedBox(height: 10.0),
            textFieldBuilder(_password, "Heslo", true),
            const SizedBox(height: 20.0),
            Center(
              child: RaisedButton(
                child: Text("Přihlásit"),
                onPressed: () async {
                  try {
                    await ApiService.instance
                        .login(email: _email.text, password: _password.text);
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  } on AppwriteException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.message ?? "Unknown error"),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: OutlineButton(
                child: Text("Zaregistrovat se"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField textFieldBuilder(controller, String title, bool isPasswd) {
    return !isPasswd
        ? TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: title,
            ),
          )
        : TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: title,
            ),
          );
  }
}
