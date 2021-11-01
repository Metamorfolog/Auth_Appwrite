import 'package:appwrite/appwrite.dart';
import '/login_service/model/services/api_service.dart';
import 'package:auth_app/presentation/routes.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
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
              "Registrace",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 20.0),
            textFieldBuilder(_name, "Jméno", false),
            const SizedBox(height: 10.0),
            textFieldBuilder(_email, "Email", false),
            const SizedBox(height: 10.0),
            textFieldBuilder(_password, "Heslo", true),
            const SizedBox(height: 20.0),
            Center(
              child: RaisedButton(
                child: Text("Registrovat"),
                onPressed: () async {
                  try {
                    await ApiService.instance.signup(
                        email: _email.text,
                        password: _password.text,
                        name: _name.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Úspěšně zaregistrován. Nyní se můžeš přihlásit."),
                      ),
                    );
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
                child: Text("Přihlásit se"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
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
