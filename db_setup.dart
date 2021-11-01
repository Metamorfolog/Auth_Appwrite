import 'package:dart_appwrite/dart_appwrite.dart';

Client client = Client(endPoint: "http://pikldev.ml:4444/v1")
    .setProject("617e9a01a956d")
    .setKey(
      "4d176b1dc49119f49f3888d4b1e75c6433e9b55906c4497b90b138865507769ff9b1eb99c6d40d7119ff1acce17cb6806b9594234bfb9e4e0a0d245e0849f831105e81e8d0d8bce092d21dd479037e69b74d9bd3bb05479a78a6ca987b7f79b7bef39f59cfc565ed9a0eea337db5402f62adcf4e516a703ea038210d4db07cc1",
    );
Database db = Database(client);

void main() async {
  final collections = await getCollection();

  bool exists = false;
  if (collections != null) {
    collections.forEach((element) {
      if (element['name'] == "Entries") {
        exists = true;
      }
    });
  }

  if (!exists)
    await createCollection();
  else
    print("Collectrion already exists!");
}

createCollection() async {
  try {
    final res = await db.createCollection(name: 'Entries', read: [
      'role:member'
    ], write: [
      'role:member'
    ], rules: [
      {
        "key": "title",
        "label": "Title",
        "type": "text",
        "default": "",
        "array": false,
        "required": true,
      },
      {
        "key": "description",
        "label": "Description",
        "type": "text",
        "default": "",
        "array": false,
        "required": false,
      },
      {
        "key": "user_id",
        "label": "User_id",
        "type": "text",
        "default": "",
        "array": false,
        "required": true,
      },
      {
        "key": "transaction_type",
        "label": "Transaction Type",
        "type": "text",
        "default": "1",
        "array": false,
        "required": true,
      },
      {
        "key": "amount",
        "label": "Amount",
        "type": "numeric",
        "default": "",
        "array": false,
        "required": true,
      },
      {
        "key": "transaction_date",
        "label": "Transaction Date",
        "type": "text",
        "default": "",
        "array": false,
        "required": true,
      },
      {
        "key": "created_at",
        "label": "Created At",
        "type": "text",
        "default": "",
        "array": false,
        "required": true,
      },
      {
        "key": "updated_at",
        "label": "Updated At",
        "type": "text",
        "default": "",
        "array": false,
        "required": true,
      },
    ]);
    print(res.data);
    print("Collection entries created");
  } on AppwriteException catch (e) {
    print(e.message);
  }
}

Future<List?> getCollection() async {
  try {
    final res = await db.listCollections();
    return res.data["collections"];
  } on AppwriteException catch (e) {
    print(e.message);
    return null;
  }
}
