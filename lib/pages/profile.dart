import 'package:auth_app/login_service/model/services/api_service.dart';
import 'package:auth_app/login_service/model/user.dart';
import '../presentation/routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      // body: ListView(
      //   padding: EdgeInsets.all(16),
      //   children: [
      //     Text(user.name),
      //   ],
      // ),

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
