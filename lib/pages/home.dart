import 'package:auth_app/widgets/transaction_list.dart';

import '/presentation/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgeter'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.profile);
            },
          )
        ],
      ),
      body: TransactionList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => Navigator.pushNamed(
          context,
          AppRoutes.addTransaction,
        ),
      ),
    );
  }
}
