import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/model/model_produk.dart';
import 'package:ecommerce/model/model_transaksi.dart';

class vmTransaksi {
  Future<List> getTransaksi() async {
    final DbHelper _helper = new DbHelper();

    Preferences preferences = Preferences();
    String nohp = await preferences.getNoHP();
    String _strWhere = "NOHP = '$nohp' ";

    List arrData = [];

    arrData = await _helper.getData(
        tableName: TransaksiQuery.TABLE_HEADER_NAME, strWhere: _strWhere);

    return arrData;
  }

  Future<List> getTransaksiHeader({String? transID}) async {
    final DbHelper _helper = new DbHelper();

    Preferences preferences = Preferences();
    String nohp = await preferences.getNoHP();

    String _strWhere = "TRANSID = '$transID' and NOHP = '$nohp' ";

    List arrData = [];

    arrData = await _helper.getData(
        tableName: TransaksiQuery.TABLE_HEADER_NAME, strWhere: _strWhere);

    return arrData;
  }

  Future<List> getTransaksiDetail({String? transID}) async {
    final DbHelper _helper = new DbHelper();

    Preferences preferences = Preferences();
    String nohp = await preferences.getNoHP();

    String _strWhere = "TRANSID = '$transID' and NOHP = '$nohp' ";

    List arrData = [];

    arrData = await _helper.getData(
        tableName: TransaksiQuery.TABLE_DETAIL_NAME, strWhere: _strWhere);

    return arrData;
  }
}
