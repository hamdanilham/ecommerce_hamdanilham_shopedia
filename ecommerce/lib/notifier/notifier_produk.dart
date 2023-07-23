import 'package:ecommerce/viewmodel/vm_produk.dart';
import 'package:ecommerce/viewmodel/vm_user.dart';
import 'package:flutter/cupertino.dart';

class ProdukNotifier extends ChangeNotifier {
  List<dynamic> lstProduk = [];
  List<dynamic> lstProdukSM = [];
  List<dynamic> lstProdukXI = [];
  List<dynamic> lstProdukIP = [];
  dynamic lstDetailValue;

  int count = 0;
  String produkID = '';

  ProdukNotifier() {
    init();
  }

  listValue() => lstProduk;

  listValueSM() => lstProdukSM;

  listValueXI() => lstProdukXI;

  listValueIP() => lstProdukIP;

  listDetailValue() => lstDetailValue;

  selectDetail(String id) async {
    produkID = id;
    notifyListeners();
  }

  getCount() => count;

  init() async {
    lstProduk = await getProduk();
    lstProdukSM = await getProdukSamsung();
    lstProdukXI = await getProdukXiaomi();
    lstProdukIP = await getProdukIphone();
    lstDetailValue = await getDetailProduk();

    notifyListeners();
  }

  Future<List<dynamic>> getProduk() async {
    vmProduk objvmProdukList = new vmProduk();
    List<dynamic> lstProduk = await objvmProdukList.getProduk();

    print("cek produk");
    print(lstProduk);

    List _elements = [];

    lstProduk.forEach((element) {
      count++;
      var obj = {
        'id': element["id"],
        'PRODUCTID': element["PRODUCTID"],
        'NAMAPRODUK': element["NAMAPRODUK"],
        'HARGAPRODUK': element["HARGAPRODUK"],
        'DESKRIPSIPRODUK': element["DESKRIPSIPRODUK"],
        'GAMBARPRODUK': element["GAMBARPRODUK"],
        'KODETOKO': element["KODETOKO"],
        'STOK': element["STOK"],
      };
      _elements.add(obj);
    });

    return _elements;
  }

  Future<List<dynamic>> getProdukSamsung() async {
    vmProduk objvmProdukList = new vmProduk();
    List<dynamic> lstProdukSM =
        await objvmProdukList.getProdukSelected(jenis: "Samsung");

    print("cek produk");
    print(lstProdukSM);

    List _elements = [];

    lstProdukSM.forEach((element) {
      count++;
      var obj = {
        'id': element["id"],
        'PRODUCTID': element["PRODUCTID"],
        'NAMAPRODUK': element["NAMAPRODUK"],
        'HARGAPRODUK': element["HARGAPRODUK"],
        'DESKRIPSIPRODUK': element["DESKRIPSIPRODUK"],
        'GAMBARPRODUK': element["GAMBARPRODUK"],
        'KODETOKO': element["KODETOKO"],
        'STOK': element["STOK"],
      };
      _elements.add(obj);
    });

    return _elements;
  }

  Future<List<dynamic>> getProdukXiaomi() async {
    vmProduk objvmProdukList = new vmProduk();
    List<dynamic> lstProdukSM =
        await objvmProdukList.getProdukSelected(jenis: "Xiaomi");

    print("cek produk");
    print(lstProdukSM);

    List _elements = [];

    lstProdukSM.forEach((element) {
      count++;
      var obj = {
        'id': element["id"],
        'PRODUCTID': element["PRODUCTID"],
        'NAMAPRODUK': element["NAMAPRODUK"],
        'HARGAPRODUK': element["HARGAPRODUK"],
        'DESKRIPSIPRODUK': element["DESKRIPSIPRODUK"],
        'GAMBARPRODUK': element["GAMBARPRODUK"],
        'KODETOKO': element["KODETOKO"],
        'STOK': element["STOK"],
      };
      _elements.add(obj);
    });

    return _elements;
  }

  Future<List<dynamic>> getProdukIphone() async {
    vmProduk objvmProdukList = new vmProduk();
    List<dynamic> lstProdukSM =
        await objvmProdukList.getProdukSelected(jenis: "Iphone");

    print("cek produk");
    print(lstProdukSM);

    List _elements = [];

    lstProdukSM.forEach((element) {
      count++;
      var obj = {
        'id': element["id"],
        'PRODUCTID': element["PRODUCTID"],
        'NAMAPRODUK': element["NAMAPRODUK"],
        'HARGAPRODUK': element["HARGAPRODUK"],
        'DESKRIPSIPRODUK': element["DESKRIPSIPRODUK"],
        'GAMBARPRODUK': element["GAMBARPRODUK"],
        'KODETOKO': element["KODETOKO"],
        'STOK': element["STOK"],
      };
      _elements.add(obj);
    });

    return _elements;
  }

  Future<dynamic> getDetailProduk() async {
    vmProduk objvmProdukList = new vmProduk();
    List<dynamic> lstDetailProduk =
        await objvmProdukList.getDetailProduk(id: produkID);

    print("cek detail produk");
    print(lstDetailProduk);

    // List _elements = [];

    dynamic obj;

    lstDetailProduk.forEach((element) {
      count++;
      obj = {
        'id': element["id"],
        'PRODUCTID': element["PRODUCTID"],
        'NAMAPRODUK': element["NAMAPRODUK"],
        'HARGAPRODUK': element["HARGAPRODUK"],
        'DESKRIPSIPRODUK': element["DESKRIPSIPRODUK"],
        'GAMBARPRODUK': element["GAMBARPRODUK"],
        'KODETOKO': element["KODETOKO"],
        'STOK': element["STOK"],
      };
      // _elements.add(obj);
    });

    return obj;
  }
}
