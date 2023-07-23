class TransaksiQuery {
  static const String TABLE_HEADER_NAME = "TransHeader";
  static const String CREATE_TABLE_HEADER =
      "CREATE TABLE IF NOT EXISTS $TABLE_HEADER_NAME " +
          "( id INTEGER PRIMARY KEY AUTOINCREMENT, TRANSID TEXT, TRANSDATE TEXT, NOHP TEXT, " +
          "PAYMENTYPE TEXT, TOTAL DOUBLE, JUMLAHORDER INTEGER, NOTES TEXT)";

  static const String TABLE_DETAIL_NAME = "TransDetail";
  static const String CREATE_TABLE_DETAIL =
      "CREATE TABLE IF NOT EXISTS $TABLE_DETAIL_NAME " +
          "( id INTEGER PRIMARY KEY AUTOINCREMENT, TRANSID TEXT, PRODUCTID TEXT, PRODUCTNAME TEXT, NOHP TEXT, " +
          "HARGA DOUBLE, QTY INTEGER)";
}

class TransaksiHeader {
  int id = 0;
  String? TRANSID = "";
  String? TRANSDATE = "";
  String? NOHP = "";
  String? PAYMENTTYPE = "";
  double? TOTAL = 0;
  int? JUMLAHORDER = 0;
  String? NOTES = "";

  TransaksiHeader({
    required this.id,
    String? this.TRANSID,
    String? this.TRANSDATE,
    String? this.NOHP,
    String? this.PAYMENTTYPE,
    double? this.TOTAL,
    int? this.JUMLAHORDER,
    String? this.NOTES,
  });

  factory TransaksiHeader.fromJson(Map<String, dynamic> json) {
    return TransaksiHeader(
      id: json['id'],
      TRANSID: json['TRANSID'] ?? "",
      TRANSDATE: json['TRANSDATE'] ?? "",
      NOHP: json['NOHP'] ?? "",
      PAYMENTTYPE: json['PAYMENTTYPE'] ?? "",
      TOTAL: json['TOTAL'] ?? 0,
      JUMLAHORDER: json['JUMLAHORDER'] ?? 0,
      NOTES: json['NOTES'] ?? "",
    );
  }

  TransaksiHeader.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.TRANSID = map['TRANSID'];
    this.TRANSDATE = map['TRANSDATE'];
    this.NOHP = map['NOHP'];
    this.PAYMENTTYPE = map['PAYMENTTYPE'];
    this.TOTAL = map['TOTAL'];
    this.JUMLAHORDER = map['JUMLAHORDER'];
    this.NOTES = map['NOTES'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['TRANSID'] = this.TRANSID;
    data['TRANSDATE'] = this.TRANSDATE;
    data['NOHP'] = this.NOHP;
    data['PAYMENTTYPE'] = this.PAYMENTTYPE;
    data['TOTAL'] = this.TOTAL;
    data['JUMLAHORDER'] = this.JUMLAHORDER;
    data['NOTES'] = this.NOTES;
    return data;
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = new Map<String, Object>();

    data['id'] = this.id;
    data['TRANSID'] = this.TRANSID ?? "";
    data['TRANSDATE'] = this.TRANSDATE ?? "";
    data['NOHP'] = this.NOHP ?? "";
    data['PAYMENTTYPE'] = this.PAYMENTTYPE ?? "";
    data['TOTAL'] = this.TOTAL ?? 0;
    data['JUMLAHORDER'] = this.JUMLAHORDER ?? 0;
    data['NOTES'] = this.NOTES ?? "";
    return data;
  }
}

class TransaksiDetail {
  int id = 0;
  String? TRANSID = "";
  String? PRODUCTID = "";
  String? PRODUCTNAME = "";
  double? HARGA = 0;
  int? QTY = 0;
  String? NOHP = "";

  TransaksiDetail({
    required this.id,
    String? this.TRANSID,
    String? this.PRODUCTID,
    String? this.PRODUCTNAME,
    double? this.HARGA,
    int? this.QTY,
    String? this.NOHP,
  });

  factory TransaksiDetail.fromJson(Map<String, dynamic> json) {
    return TransaksiDetail(
      id: json['id'],
      TRANSID: json['TRANSID'] ?? "",
      PRODUCTID: json['PRODUCTID'] ?? "",
      PRODUCTNAME: json['PRODUCTNAME'] ?? "",
      HARGA: json['HARGA'] ?? 0,
      QTY: json['QTY'] ?? 0,
      NOHP: json['NOHP'] ?? "",
    );
  }

  TransaksiDetail.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.TRANSID = map['TRANSID'];
    this.PRODUCTID = map['PRODUCTID'];
    this.PRODUCTNAME = map['PRODUCTNAME'];
    this.HARGA = map['HARGA'];
    this.QTY = map['QTY'];
    this.NOHP = map['NOHP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['TRANSID'] = this.TRANSID;
    data['PRODUCTID'] = this.PRODUCTID;
    data['PRODUCTNAME'] = this.PRODUCTNAME;
    data['HARGA'] = this.HARGA;
    data['QTY'] = this.QTY;
    data['NOHP'] = this.NOHP;
    return data;
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = new Map<String, Object>();

    data['id'] = this.id;
    data['TRANSID'] = this.TRANSID ?? "";
    data['PRODUCTID'] = this.PRODUCTID ?? "";
    data['PRODUCTNAME'] = this.PRODUCTNAME ?? "";
    data['HARGA'] = this.HARGA ?? 0;
    data['QTY'] = this.QTY ?? 0;
    data['NOHP'] = this.NOHP ?? "";
    return data;
  }
}
