class UserQuery {
  static const String TABLE_NAME = "User";
  static const String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS $TABLE_NAME " +
      "( id INTEGER PRIMARY KEY AUTOINCREMENT, NAMA TEXT, EMAIL TEXT, NOHP TEXT, PASSWORD TEXT, SALDO DOUBLE, TGLDAFTAR TEXT)";
}

class User {
  int id = 0;
  String? NAMA = "";
  String? EMAIL = "";
  String? NOHP = "";
  String? PASSWORD = "";
  double? SALDO = 0;
  String? TGLDAFTAR = "";

  User(
      {required this.id,
      String? this.NAMA,
      String? this.EMAIL,
      String? this.NOHP,
      String? this.PASSWORD,
      double? this.SALDO,
      String? this.TGLDAFTAR});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      NAMA: json['NAMA'] ?? "",
      EMAIL: json['EMAIL'] ?? "",
      NOHP: json['NOHP'] ?? "",
      PASSWORD: json['PASSWORD'] ?? "",
      SALDO: json['SALDO'] ?? 0,
      TGLDAFTAR: json['TGLDAFTAR'] ?? "",
    );
  }

  User.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.NAMA = map['NAMA'];
    this.EMAIL = map['EMAIL'];
    this.NOHP = map['NOHP'];
    this.PASSWORD = map['PASSWORD'];
    this.SALDO = map['SALDO'];
    this.TGLDAFTAR = map['TGLDAFTAR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['NAMA'] = this.NAMA;
    data['EMAIL'] = this.EMAIL;
    data['NOHP'] = this.NOHP;
    data['PASSWORD'] = this.PASSWORD;
    data['SALDO'] = this.SALDO;
    data['TGLDAFTAR'] = this.TGLDAFTAR;
    return data;
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = new Map<String, Object>();

    data['id'] = this.id;
    data['NAMA'] = this.NAMA ?? "";
    data['EMAIL'] = this.EMAIL ?? "";
    data['NOHP'] = this.NOHP ?? "";
    data['PASSWORD'] = this.PASSWORD ?? "";
    data['SALDO'] = this.SALDO ?? 0;
    data['TGLDAFTAR'] = this.TGLDAFTAR ?? "";
    return data;
  }
}
