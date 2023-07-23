import 'package:ecommerce/viewmodel/vm_produk.dart';
import 'package:ecommerce/viewmodel/vm_transaksi.dart';
import 'package:ecommerce/viewmodel/vm_user.dart';
import 'package:flutter/cupertino.dart';

class TransaksiNotifier extends ChangeNotifier {
  List<dynamic> lstTransaksi = [];

  int count = 0;
  String transID = '';

  TransaksiNotifier() {
    init();
  }

  listValue() => lstTransaksi;

  selectDetail(String id) async {
    transID = id;
    notifyListeners();
  }

  getCount() => count;

  init() async {
    lstTransaksi = await getTransaksi();

    notifyListeners();
  }

  updateValue() async {
    lstTransaksi = await getTransaksi();

    notifyListeners();
  }

  Future<List<dynamic>> getTransaksi() async {
    vmTransaksi objvmTransaksi = new vmTransaksi();
    List<dynamic> lstTransaksi = await objvmTransaksi.getTransaksi();

    print("cek trans");
    print(lstTransaksi);

    List _elements = [];

    lstTransaksi.forEach((element) {
      var obj = {
        'id': element["id"],
        'TRANSID': element["TRANSID"],
        'TRANSDATE': element["TRANSDATE"],
        'NOHP': element["NOHP"],
        'PAYMENTYPE': element["PAYMENTYPE"],
        'TOTAL': element["TOTAL"],
        'JUMLAHORDER': element["JUMLAHORDER"],
        'NOTES': element["NOTES"],
      };
      _elements.add(obj);
    });

    return _elements;
  }
}
