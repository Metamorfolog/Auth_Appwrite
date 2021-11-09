import 'dart:ui';

import 'package:auth_app/login_service/model/services/transaction_state.dart';
import 'package:auth_app/presentation/routes.dart';
import 'package:auth_app/transactions/model/transaction.dart';
import 'package:auth_app/login_service/res/providers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: Provider.of<TransactionState>(context).transactions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Transaction> transactions = snapshot.data;
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                Transaction transaction = transactions[index];
                return ListTile(
                  leading: Icon(transaction.transactionType == 1
                      ? Icons.account_balance_wallet
                      : Icons.view_list),
                  title: Text(transaction.title),
                  subtitle: Text(
                      DateFormat.yMMMEd().format(transaction.transactionDate)),
                  trailing: Text(transaction.amount.toString()),
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.transactionDetails,
                    arguments: transaction,
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Načítání",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ],
              ),
            );
          }
        },
      ),

      // child: FutureBuilder(
      //   future: Provider.of<TransactionState>(context).transactions(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       List<Transaction> transactions = snapshot.data;
      //       return ListView.builder(
      //         itemCount: transactions.length,
      //         itemBuilder: (context, index) {
      //           Transaction transaction = transactions[index];
      //           return ListTile(
      //             leading: Icon(transaction.transactionType == 1
      //                 ? Icons.account_balance_wallet
      //                 : Icons.view_list),
      //             title: Text(transaction.title),
      //             subtitle: Text(
      //                 DateFormat.yMMMEd().format(transaction.transactionDate)),
      //             trailing: Text(transaction.amount.toString()),
      //           );
      //         },
      //       );
      //     }
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "Načítání",
      //             style: TextStyle(
      //               fontSize: 25,
      //             ),
      //           ),
      //           const SizedBox(height: 20.0),
      //           CircularProgressIndicator(
      //             color: Colors.black,
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
