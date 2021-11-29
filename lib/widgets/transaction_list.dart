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
    List<Transaction> transactions =
        Provider.of<TransactionState>(context).transactions;
    return Center(
        child: ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        Transaction transaction = transactions[index];
        return ListTile(
          leading: Icon(transaction.transactionType == 1
              ? Icons.account_balance_wallet
              : Icons.view_list),
          title: Text(transaction.title),
          subtitle: Text(
              DateFormat('dd.MM.yyyy').format(transaction.transactionDate)),
          trailing: Text(transaction.amount.toString()),
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.transactionDetails,
            arguments: transaction,
          ),
        );
      },
    ));
  }
}
