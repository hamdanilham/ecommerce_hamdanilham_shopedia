import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/model/model_cart.dart';

class vmCart {
  Future<List> getCart({String? id}) async {
    final DbHelper _helper = new DbHelper();
    Preferences preferences = Preferences();
    String nohp = await preferences.getNoHP();
    String _strWhere = "NOHP = '$nohp' ";
    List<Object>? _whereArgs;

    List arrData = [];

    arrData = await _helper.getData(
        tableName: CartQuery.TABLE_NAME, strWhere: _strWhere);

    return arrData;
  }
}
