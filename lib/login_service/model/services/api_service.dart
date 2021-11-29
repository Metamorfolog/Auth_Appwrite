import 'package:appwrite/appwrite.dart';
//import 'package:auth_app/login_service/model/user.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import '/login_service/res/app_constants.dart';

class ApiService extends ChangeNotifier {
  static ApiService? _instance;
  late final Client _client;
  late final Account _account;
  late final Database _db;
  final User? _user = null;

  User? get user => _user;

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
    return res = (await _account.get()) as User;
  }

  Future logout() {
    return _account.deleteSession(sessionId: 'current');
  }
}
