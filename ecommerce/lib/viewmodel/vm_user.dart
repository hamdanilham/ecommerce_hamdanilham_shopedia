import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/model/model_user.dart';

class vmUser {
  Future<List> getUser({String? nomor_hp, String? password}) async {
    final DbHelper _helper = new DbHelper();
    Preferences preferences = Preferences();
    String _strWhere = "";
    List<Object>? _whereArgs;

    List arrData = [];

    if (nomor_hp != null && password != null) {
      if (nomor_hp != '' && password != '') {
        _strWhere += "NOHP = '$nomor_hp' and PASSWORD = '$password'";

        arrData = await _helper.getData(
          tableName: UserQuery.TABLE_NAME,
          strWhere: _strWhere,
        );
      }
    }

    return arrData;
  }
}
