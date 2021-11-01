import '/login_service/model/services/api_service.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import '../login_service/pages/login.dart';
import '../login_service/pages/waiting.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.instance.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return WaitingScreen();
        if (snapshot.hasData) return HomePage();
        return LoginPage();
      },
    );
  }
}
