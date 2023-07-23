import 'package:ecommerce/model/model_cart.dart';
import 'package:ecommerce/viewmodel/vm_cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartNotifier extends ChangeNotifier {
  // List<Cart> _lstCart = [];
  List<dynamic> _lstCart = [];
  int _count = 0;
  double _amount = 0;
  String idProduk = "";

  CartNotifier() {
    init();
  }

  init() async {
    print("provider init");
    _lstCart = await getAllCart();

    notifyListeners();
  }

  listValue() => _lstCart;
  getCount() => _count;
  getAMount() => _amount;

  setID(String idprod) async {
    idProduk = idprod;
    notifyListeners();
  }

  addCart(Cart objCart) async {
    _lstCart.add(objCart);

    updateValue();
  }

  // addQty(int strId) async {
  //   _lstCart.forEach((element) {
  //     if (element.id == strId) {
  //       // if (element.QTY < element.CURRENTQTY) {
  //       element.QTY = element.QTY + 1;
  //       // }
  //     }
  //   });
  //   updateValue();
  // }

  // addAmount(int strId, int value) async {
  //   _lstCart.forEach((element) {
  //     if (element.id == strId) {
  //       element.HARGA = double.parse(value.toString());
  //     }
  //   });
  //   updateValue();
  // }

  // minQty(int strId) async {
  //   bool bolDelete = false;
  //   final DbHelper _helper = new DbHelper();
  //
  //   _lstCart.forEach((element) {
  //     if (element.id == strId) {
  //       element.QTY = element.QTY - 1;
  //       if (element.QTY == 0) bolDelete = true;
  //     }
  //   });
  //
  //   if (bolDelete) {
  //     _lstCart.removeWhere((item) => item.id == strId);
  //
  //     // await _helper.delete(
  //     //     TransaksiQuery.TABLE_DETAIL_NAME, strId);
  //   }
  //
  //   updateValue();
  // }

  // updateData(CartList objCartItem) {
  //   _lstCart.forEach((element) {
  //     if (element.id == objCartItem.id) {
  //       element.NAME = objCartItem.NAME;
  //       element.SATUAN = objCartItem.SATUAN;
  //       element.FOTO = objCartItem.FOTO;
  //       element.HARGA = objCartItem.HARGA;
  //       element.QTY = objCartItem.QTY;
  //       element.JENIS = objCartItem.JENIS;
  //     }
  //   });
  //
  //   updateValue();
  // }

  updateValue() async {
    final formatCurrency =
        NumberFormat.currency(locale: "id_ID", symbol: "Rp ", decimalDigits: 0);

    _count = _lstCart.length;

    _lstCart = await getAllCart();

    notifyListeners();
  }

  Future<List<dynamic>> getAllCart() async {
    vmCart objVmCustomer = new vmCart();
    _amount = 0;

    List<dynamic> lstCarts = await objVmCustomer.getCart(id: idProduk);
    print("lstCarts proudct init");
    print(idProduk);

    lstCarts.forEach((element) {
      _amount = _amount + (element["HARGA"] * element["QTY"]);
    });

    _count = lstCarts.length;

    return lstCarts;
  }
}
