import 'package:auth_app/login_service/model/services/transaction_state.dart';
import 'package:auth_app/transactions/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetails({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informace'),
        actions: [
          IconButton(
            onPressed: () async {
              await Provider.of<TransactionState>(context, listen: false)
                  .deleteTransaction(transaction);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Datum vytvoření " +
                DateFormat('dd.MM.yyyy').format(transaction.transactionDate),
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Název:  " + transaction.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          Text(
            "Cena:  " + transaction.amount.toString() + " Kč",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 20),
          if (transaction.description != null &&
              transaction.description.isNotEmpty)
            Text(
              "Poznámka:  " + transaction.description,
              style: TextStyle(
                fontSize: 18,
              ),
            )
        ],
      ),
    );
  }
}
