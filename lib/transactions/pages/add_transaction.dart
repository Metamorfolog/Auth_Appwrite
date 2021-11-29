import 'package:auth_app/login_service/model/services/api_service.dart';
import 'package:auth_app/login_service/model/services/transaction_state.dart';
import 'package:auth_app/transactions/model/transaction.dart';
import 'package:auth_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _tDate = DateTime.now();
  DateTime today = DateTime.now();
  int _transactionType = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transactionType = 2;
    _titleController = TextEditingController();
    _amountController = TextEditingController();
    _descriptionController = TextEditingController();
    _tDate = DateTime.now();
    today = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Přidat transakci'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  groupValue: _transactionType,
                  value: 2,
                  title: Text("Výdaj"),
                  onChanged: (val) {
                    setState(() {
                      _transactionType = val as int;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  groupValue: _transactionType,
                  value: 1,
                  title: Text("Přijem"),
                  onChanged: (val) {
                    setState(() {
                      _transactionType = val as int;
                    });
                  },
                ),
              ),
            ],
          ),
          TransactionInfoField(
            _titleController,
            TextInputType.text,
            "Název",
          ),
          const SizedBox(height: 10),
          TransactionInfoField(
            _amountController,
            TextInputType.number,
            "Cena",
          ),
          const SizedBox(height: 10),
          TransactionInfoField(
            _descriptionController,
            TextInputType.text,
            "Poznámka",
          ),
          const SizedBox(height: 10),
          CalendarDatePicker(
            firstDate: DateTime(today.year - 5),
            lastDate: today,
            initialDate: _tDate,
            onDateChanged: (date) {
              setState(() {
                _tDate = date;
              });
            },
          ),
          const SizedBox(height: 10.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save_rounded,
        ),
        onPressed: () async {
          debugPrint("-------Tady Končím?-------");
          String userId = (await ApiService.instance.getUser()).$id;
          debugPrint("-------WoooHoooo-------");
          Transaction transaction = Transaction(
            title: _titleController.text,
            amount: int.parse(_amountController.text),
            description: _descriptionController.text,
            transactionDate: _tDate,
            transactionType: _transactionType,
            userId: userId,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          TransactionState ts =
              Provider.of<TransactionState>(context, listen: false);
          ts.addTransaction(transaction);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

TextField TransactionInfoField(TextEditingController controller,
    TextInputType textInputType, String title) {
  return TextField(
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(hintText: title),
  );
}
