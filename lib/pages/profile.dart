import '../login_service/model/services/api_service.dart';
import '../presentation/routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Odhlásit se"),
          onPressed: () async {
            await ApiService.instance.logout();
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          },
        ),
      ),
    );
  }
}
