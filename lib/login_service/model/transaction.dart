class Transaction {
  late String id;
  late String collection;
  late Permissions permissions;
  late String title;
  late String description;
  late String userId;
  late int transactionType;
  late int amount;
  late DateTime transactionDate;
  late DateTime createdAt;
  late DateTime updatedAt;

  Transaction({
    required this.id,
    required this.collection,
    required this.permissions,
    required this.title,
    required this.description,
    required this.userId,
    required this.transactionType,
    required this.amount,
    required this.transactionDate,
    required this.createdAt,
    required this.updatedAt,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    collection = json['$collection'];
    permissions = (json['$permissions'] != null
        ? new Permissions.fromJson(json['$permissions'])
        : null)!;
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    transactionType = json['transaction_type'];
    amount = json['amount'];
    transactionDate =
        DateTime.fromMillisecondsSinceEpoch(json['transaction_date']);
    createdAt = DateTime.fromMillisecondsSinceEpoch(json['created_at']);
    updatedAt = DateTime.fromMillisecondsSinceEpoch(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['$collection'] = this.collection;
    if (this.permissions != null) {
      data['$permissions'] = this.permissions.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['transaction_type'] = this.transactionType;
    data['amount'] = this.amount;
    data['transaction_date'] = this.transactionDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Permissions {
  late List<String> read;
  late List<String> write;

  Permissions({required this.read, required this.write});

  Permissions.fromJson(Map<String, dynamic> json) {
    read = json['read'].cast<String>();
    write = json['write'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['read'] = this.read;
    data['write'] = this.write;
    return data;
  }
}
