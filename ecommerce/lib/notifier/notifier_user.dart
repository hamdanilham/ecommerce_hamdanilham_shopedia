import 'package:ecommerce/viewmodel/vm_user.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier extends ChangeNotifier {
  List<dynamic> lstUser = [];
  int count = 0;

  String nomorHp = "";
  String password = "";

  UserNotifier() {
    init();
  }

  listValue() => lstUser;

  getCount() => count;

  init() async {
    lstUser = await getUser();

    notifyListeners();
  }

  login(String nohp, String pass) async {
    nomorHp = nohp;
    password = pass;
    lstUser = await getUser();

    notifyListeners();
  }

  Future<List<dynamic>> getUser() async {
    vmUser objvmStockList = new vmUser();
    List<dynamic> lstUser =
        await objvmStockList.getUser(nomor_hp: nomorHp, password: password);

    List _elements = [];

    lstUser.forEach((element) {
      var obj = {
        'id': element["id"],
        'NAMA': element["NAMA"],
        'EMAIL': element["EMAIL"],
        'NOHP': element["NOHP"],
        'PASSWORD': element["PASSWORD"],
        'SALDO': element["SALDO"],
        'TGLDAFTAR': element["TGLDAFTAR"],
      };
      _elements.add(obj);
    });

    return _elements;
  }
}
