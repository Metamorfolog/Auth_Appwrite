import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:auth_app/login_service/res/app_constants.dart';
import 'package:flutter/widgets.dart';

import '../../../transactions/model/transaction.dart';

class TransactionState extends ChangeNotifier {
  final String collectionId = AppConstants.transactionCollection;
  Client client = Client();
  late Database db;
  late String _error;
  late List<Transaction> _transactions;

  List<Transaction> get transactions => _transactions;
  String get error => _error;

  TransactionState() {
    _init();
  }

  set data(List<Transaction> data) {}
  _init() {
    client.setEndpoint(AppConstants.endpoint).setProject(
          AppConstants.project,
        );
    db = Database(client);
    _transactions = [];
    getTransactions();
  }

  Future<List<Transaction>?> getTransactions() async {
    try {
      DocumentList result = await db.listDocuments(collectionId: collectionId);
      _transactions =
          (result.documents).map((e) => Transaction.fromJson(e.data)).toList();
      notifyListeners();
    } on AppwriteException catch (e) {
      return null;
    }
  }

  Future addTransaction(Transaction transaction) async {
    try {
      var res = await db.createDocument(
        collectionId: AppConstants.transactionCollection,
        data: transaction.toJson(),
        read: ["user:${transaction.userId}"],
        write: ["user:${transaction.userId}"],
      );
      _transactions.add(Transaction.fromJson(res.data));
      notifyListeners();
      print(res);
    } on AppwriteException catch (e) {
      print(e.message);
    }
  }

  Future deleteTransaction(Transaction transaction) async {
    try {
      await db.deleteDocument(
        collectionId: collectionId,
        documentId: transaction.id.toString(),
      );
      _transactions = List<Transaction>.from(
          _transactions.where((trans) => trans.id != transaction.id));
      notifyListeners();
    } on AppwriteException catch (e) {
      print(e.message);
    }
  }
}
