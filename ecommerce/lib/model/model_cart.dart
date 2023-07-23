class CartQuery {
  static const String TABLE_NAME = "Cart";
  static const String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS $TABLE_NAME " +
      "( id INTEGER PRIMARY KEY AUTOINCREMENT, PRODUCTID TEXT, PRODUCTNAME TEXT, HARGA DOUBLE, QTY INTEGER, STATUS TEXT, NOHP TEXT)";
}

class Cart {
  int id = 0;
  String? PRODUCTID = "";
  String? PRODUCTNAME = "";
  double? HARGA = 0;
  int? QTY = 0;
  String? STATUS = "";
  String? NOHP = "";

  Cart({
    required this.id,
    String? this.PRODUCTID,
    String? this.PRODUCTNAME,
    double? this.HARGA,
    int? this.QTY,
    String? this.STATUS,
    String? this.NOHP,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      PRODUCTID: json['PRODUCTID'] ?? "",
      PRODUCTNAME: json['PRODUCTNAME'] ?? "",
      HARGA: json['HARGA'] ?? 0,
      QTY: json['QTY'] ?? 0,
      STATUS: json['STATUS'] ?? "",
      NOHP: json['NOHP'] ?? "",
    );
  }

  Cart.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.PRODUCTID = map['PRODUCTID'];
    this.PRODUCTNAME = map['PRODUCTNAME'];
    this.HARGA = map['HARGA'];
    this.QTY = map['QTY'];
    this.STATUS = map['STATUS'];
    this.NOHP = map['NOHP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['PRODUCTID'] = this.PRODUCTID;
    data['PRODUCTNAME'] = this.PRODUCTNAME;
    data['HARGA'] = this.HARGA;
    data['QTY'] = this.QTY;
    data['STATUS'] = this.STATUS;
    data['NOHP'] = this.NOHP;
    return data;
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = new Map<String, Object>();

    data['id'] = this.id;
    data['PRODUCTID'] = this.PRODUCTID ?? "";
    data['PRODUCTNAME'] = this.PRODUCTNAME ?? "";
    data['HARGA'] = this.HARGA ?? 0;
    data['QTY'] = this.QTY ?? 0;
    data['STATUS'] = this.STATUS ?? "";
    data['NOHP'] = this.NOHP ?? "";
    return data;
  }
}
