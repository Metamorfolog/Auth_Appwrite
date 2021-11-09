import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import '../../../transactions/model/transaction.dart';
import '/login_service/res/app_constants.dart';

class ApiService {
  static ApiService? _instance;
  late final Client _client;
  late final Account _account;
  late final Database _db;

  ApiService._internal() {
    _client = Client(
      endPoint: AppConstants.endpoint,
    ).setProject(AppConstants.project);
    _account = Account(_client);
    _db = Database(_client);
  }

  static ApiService get instance {
    // ignore: prefer_conditional_assignment
    if (_instance == null) {
      _instance = ApiService._internal();
    }
    return _instance!;
  }

  Future login({
    required email,
    required password,
  }) {
    return _account.createSession(email: email, password: password);
  }

  Future signup({
    String? name,
    required String email,
    required String password,
  }) {
    return _account.create(email: email, password: password, name: name ?? "");
  }

  Future<User> getUser() async {
    User res;
    return res = await _account.get();
  }

  Future logout() {
    return _account.deleteSession(sessionId: 'current');
  }

  // Future oAuthLogin(String provider) {
  //   return _account.createOAuth2Session(provider: provider);
  // }

  // Future<Transaction> addTransaction({
  //   required Transaction transaction,
  //   required List<String> read,
  //   required List<String> write,
  // }) async {
  //   final res = await _db.createDocument(
  //     collectionId: AppConstants.entriesCollection,
  //     data: transaction.toJson(),
  //     read: read,
  //     write: write,
  //   );
  //   return Transaction.fromJson(res.data);
  // }

  // Future<List<Transaction>> readTransactions() async {
  //   final res = await _db.listDocuments(
  //       collectionId: AppConstants.transactionCollection);
  //   print(res);
  //   return List<Map<String, dynamic>>.from(res.documents)
  //       .map((e) => Transaction.fromJson(e))
  //       .toList();
  // }

  // Future readTransaction() async {
  //   var result = await _db.listDocuments(
  //     collectionId: AppConstants.entriesCollection,
  //   );

  //   return result.then((response) {
  //     print(response);
  //     print(result);
  //   }).catchError((error) {
  //     print(error.response);
  //   });
  // }

  // Future<List<Transaction>?> readTransactions() async {
  //   try {
  //     final res = await _db
  //         .listDocuments(
  //           collectionId: AppConstants.transactionCollection,
  //         )
  //         .toString();
  //     print(res);
  //     debugPrint(res);
  //   } on AppwriteException catch (e) {
  //     print(e.message);
  //     return null;
  //   }
  // }

  // Future<List<Transaction>?> transactions() async {
  //   try {
  //     Response res = await _db.listDocuments(
  //         collectionId: AppConstants.transactionCollection) as Response;
  //     return List<Transaction>.from(
  //         res.data["documents"].map((tr) => Transaction.fromJson(tr)));
  //   } on AppwriteException catch (e) {
  //     print(e.message);
  //     return null;
  //   }
  // }
}
