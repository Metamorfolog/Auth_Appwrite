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
  }

  Future seeTransaction() async {
    var result = await db.listDocuments(collectionId: collectionId);
    print("Success " + result.documents.length.toString());
    var data =
        (result.documents).map((e) => Transaction.fromJson(e.data)).toList();
    print(data.toList());
  }

  Future<List<Transaction>> transactions() async {
    {
      DocumentList result = await db.listDocuments(collectionId: collectionId);

      return data =
          (result.documents).map((e) => Transaction.fromJson(e.data)).toList();
    }
  }
}
