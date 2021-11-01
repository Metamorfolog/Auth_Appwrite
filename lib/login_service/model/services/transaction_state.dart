import 'package:appwrite/appwrite.dart';
import 'package:auth_app/login_service/res/app_constants.dart';
import 'package:flutter/widgets.dart';

import '../transaction.dart';

class TransactionState extends ChangeNotifier {
  final String collectionId = AppConstants.transactionCollection;
  Client client = Client();
  late Database db;
  late String _error;

  String get error => _error;

  TransactionState() {
    _init();
  }
  _init() {
    client.setEndpoint(AppConstants.endpoint).setProject(
          AppConstants.project,
        );
    db = Database(client);
  }

  // Future<List<Transaction>?> transactions() async {
  //   try {
  //     Response res =
  //         await db.listDocuments(collectionId: collectionId) as Response;
  //     return List<Transaction>.from(
  //         res.data["documents"].map((tr) => Transaction.fromJson(tr)));
  //   } on AppwriteException catch (e) {
  //     print(e.message);
  //     return null;
  //   }
  // }

  Future<List<Transaction>?> readTransactions() async {
    try {
      final res = await db
          .listDocuments(
            collectionId: AppConstants.transactionCollection,
          )
          .toString();
      print(res);
      debugPrint(res);
    } on AppwriteException catch (e) {
      print(e.message);
      return null;
    }
  }
}
