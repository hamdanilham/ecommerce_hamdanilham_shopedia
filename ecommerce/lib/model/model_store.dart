class StoreQuery {
  static const String TABLE_NAME = "Store";
  static const String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS $TABLE_NAME " +
      "( id INTEGER PRIMARY KEY AUTOINCREMENT, KODESTORE TEXT, NAMASTORE TEXT, DESKRIPSISTORE TEXT, GAMBARSTORE TEXT)";
}

class Store {
  int id = 0;
  String? KODESTORE = "";
  String? NAMASTORE = "";
  String? DESKRIPSISTORE = "";
  String? GAMBARSTORE = "";

  Store({
    required this.id,
    String? this.KODESTORE,
    String? this.NAMASTORE,
    String? this.DESKRIPSISTORE,
    String? this.GAMBARSTORE,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      KODESTORE: json['KODESTORE'] ?? "",
      NAMASTORE: json['NAMASTORE'] ?? "",
      DESKRIPSISTORE: json['DESKRIPSISTORE'] ?? "",
      GAMBARSTORE: json['GAMBARSTORE'] ?? "",
    );
  }

  Store.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.KODESTORE = map['KODESTORE'];
    this.NAMASTORE = map['NAMASTORE'];
    this.DESKRIPSISTORE = map['DESKRIPSISTORE'];
    this.GAMBARSTORE = map['GAMBARSTORE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['KODESTORE'] = this.KODESTORE;
    data['NAMASTORE'] = this.NAMASTORE;
    data['DESKRIPSISTORE'] = this.DESKRIPSISTORE;
    data['GAMBARSTORE'] = this.GAMBARSTORE;
    return data;
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = new Map<String, Object>();

    data['id'] = this.id;
    data['KODESTORE'] = this.KODESTORE ?? "";
    data['NAMASTORE'] = this.NAMASTORE ?? "";
    data['DESKRIPSISTORE'] = this.DESKRIPSISTORE ?? "";
    data['GAMBARSTORE'] = this.GAMBARSTORE ?? "";
    return data;
  }
}
