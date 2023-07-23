class ProdukQuery {
  static const String TABLE_NAME = "Produk";
  static const String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS $TABLE_NAME " +
      "( id INTEGER PRIMARY KEY AUTOINCREMENT, PRODUCTID TEXT, NAMAPRODUK TEXT, HARGAPRODUK DOUBLE, DESKRIPSIPRODUK TEXT, GAMBARPRODUK TEXT, KODETOKO TEXT, STOK INTEGER)";
}

class Produk {
  int id = 0;
  String? PRODUCTID = "";
  String? NAMAPRODUK = "";
  double? HARGAPRODUK = 0;
  String? DESKRIPSIPRODUK = "";
  String? GAMBARPRODUK = "";
  String? KODETOKO = "";
  int? STOK = 0;

  Produk({
    required this.id,
    String? this.PRODUCTID,
    String? this.NAMAPRODUK,
    double? this.HARGAPRODUK,
    String? this.DESKRIPSIPRODUK,
    String? this.GAMBARPRODUK,
    String? this.KODETOKO,
    int? this.STOK,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      PRODUCTID: json['PRODUCTID'] ?? "",
      NAMAPRODUK: json['NAMAPRODUK'] ?? "",
      HARGAPRODUK: json['HARGAPRODUK'] ?? 0,
      DESKRIPSIPRODUK: json['DESKRIPSIPRODUK'] ?? "",
      GAMBARPRODUK: json['GAMBARPRODUK'] ?? "",
      KODETOKO: json['KODETOKO'] ?? "",
      STOK: json['STOK'] ?? 0,
    );
  }

  Produk.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.NAMAPRODUK = map['NAMAPRODUK'];
    this.PRODUCTID = map['PRODUCTID'];
    this.HARGAPRODUK = map['HARGAPRODUK'];
    this.DESKRIPSIPRODUK = map['DESKRIPSIPRODUK'];
    this.GAMBARPRODUK = map['GAMBARPRODUK'];
    this.KODETOKO = map['KODETOKO'];
    this.STOK = map['STOK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['PRODUCTID'] = this.PRODUCTID;
    data['NAMAPRODUK'] = this.NAMAPRODUK;
    data['HARGAPRODUK'] = this.HARGAPRODUK;
    data['DESKRIPSIPRODUK'] = this.DESKRIPSIPRODUK;
    data['GAMBARPRODUK'] = this.GAMBARPRODUK;
    data['KODETOKO'] = this.KODETOKO;
    data['STOK'] = this.STOK;
    return data;
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = new Map<String, Object>();

    data['id'] = this.id;
    data['PRODUCTID'] = this.PRODUCTID ?? "";
    data['NAMAPRODUK'] = this.NAMAPRODUK ?? "";
    data['HARGAPRODUK'] = this.HARGAPRODUK ?? 0;
    data['DESKRIPSIPRODUK'] = this.DESKRIPSIPRODUK ?? "";
    data['GAMBARPRODUK'] = this.GAMBARPRODUK ?? "";
    data['KODETOKO'] = this.KODETOKO ?? "";
    data['STOK'] = this.STOK ?? 0;
    return data;
  }
}
