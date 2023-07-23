import 'package:ecommerce/model/model_cart.dart';
import 'package:ecommerce/model/model_produk.dart';
import 'package:ecommerce/model/model_store.dart';
import 'package:ecommerce/model/model_transaksi.dart';
import 'package:ecommerce/model/model_user.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DbHelper {
  static DbHelper _dbHelper = DbHelper._singleton();

  factory DbHelper() {
    return _dbHelper;
  }

  DbHelper._singleton();

  final tables = [
    UserQuery.CREATE_TABLE,
    TransaksiQuery.CREATE_TABLE_HEADER,
    TransaksiQuery.CREATE_TABLE_DETAIL,
    StoreQuery.CREATE_TABLE,
    ProdukQuery.CREATE_TABLE,
    CartQuery.CREATE_TABLE
  ];

  Future<Database> openDB() async {
    final dbPath = await sqlite.getDatabasesPath();

    return sqlite.openDatabase(path.join(dbPath, 'ecommerce.db'),
        onCreate: (db, version) {
      tables.forEach((table) async {
        await db.execute(table).then((value) {}).catchError((err) {
          print("errornya ${err.toString()}");
        });
      });
      // print('Table Created');
    }, onUpgrade: (db, oldVersion, newVersion) async {
      var batch = db.batch();

      await batch.commit();
    }, version: 1);
  }

  Future<int> insert(String table, Map<String, Object> data) async {
    data['id'] = "";
    data.removeWhere((key, value) => key == "id");

    Database db = await openDB();

    int count = await db.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return count;
  }

  Future<int> update(String table, Map<String, Object> data) async {
    Database db = await openDB();
    int count = await db.update(table, data,
        where: 'id=?',
        whereArgs: [data['id']],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return count;
  }

  Future<int> delete(String table, int id) async {
    Database db = await openDB();
    int count = await db.delete(table, where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List> getData(
      {required String tableName,
      String? SortBy,
      String? strWhere,
      List<Object>? whereArgs,
      int? limit,
      int? offset}) async {
    final db = await openDB();

    var result = await db.query(tableName,
        orderBy: SortBy,
        where: strWhere,
        whereArgs: whereArgs,
        limit: limit,
        offset: offset);
    return result.toList();
  }
}
