import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/model/model_produk.dart';

class vmProduk {
  Future<List> getProduk() async {
    final DbHelper _helper = new DbHelper();
    Preferences preferences = Preferences();
    String _strWhere = "";
    List<Object>? _whereArgs;

    List arrData = [];

    arrData = await _helper.getData(
      tableName: ProdukQuery.TABLE_NAME,
    );

    return arrData;
  }

  Future<List> getProdukSelected({String? jenis}) async {
    final DbHelper _helper = new DbHelper();

    String kode = '';

    if (jenis == "Samsung") {
      kode = 'HPSM';
    } else if (jenis == 'Xiaomi') {
      kode = 'HPXI';
    } else {
      kode = 'HPIP';
    }

    String _strWhere = "KODETOKO = '$kode' ";

    List arrData = [];

    arrData = await _helper.getData(
        tableName: ProdukQuery.TABLE_NAME, strWhere: _strWhere);

    return arrData;
  }

  Future<List> getDetailProduk({String? id}) async {
    final DbHelper _helper = new DbHelper();

    String _strWhere = "PRODUCTID = '$id' ";

    List arrData = [];

    arrData = await _helper.getData(
        tableName: ProdukQuery.TABLE_NAME, strWhere: _strWhere);

    return arrData;
  }
}
