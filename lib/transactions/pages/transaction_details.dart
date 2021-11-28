import 'package:auth_app/transactions/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetails({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            DateFormat('dd.MM.yyyy').format(transaction.transactionDate),
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            transaction.amount.toString(),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          if (transaction.description != null &&
              transaction.description.isNotEmpty)
            Text(
              transaction.description,
              style: TextStyle(
                fontSize: 18,
              ),
            )
        ],
      ),
    );
  }
}
