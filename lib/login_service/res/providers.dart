import 'package:auth_app/login_service/model/services/transaction_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => TransactionState(),
    lazy: false,
  ),
];
