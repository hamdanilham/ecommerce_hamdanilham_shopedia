import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/model/model_produk.dart';
import 'package:ecommerce/model/model_store.dart';

class DataDummy {
  Future<bool> setData() async {
    final DbHelper _helper = new DbHelper();

    //input data toko
    Store _store = Store(id: 0);
    _store.id = 0;
    _store.NAMASTORE = "SAMSUNG";
    _store.KODESTORE = "HPSM";
    _store.GAMBARSTORE = "";
    _store.DESKRIPSISTORE = "Official Store HP Samsung";
    await _helper.insert(StoreQuery.TABLE_NAME, _store.toMap());

    _store.id = 0;
    _store.NAMASTORE = "IPHONE";
    _store.KODESTORE = "HPIP";
    _store.GAMBARSTORE = "";
    _store.DESKRIPSISTORE = "Official Store HP Iphone";
    await _helper.insert(StoreQuery.TABLE_NAME, _store.toMap());

    _store.id = 0;
    _store.NAMASTORE = "XIAOMI";
    _store.KODESTORE = "HPXI";
    _store.GAMBARSTORE = "";
    _store.DESKRIPSISTORE = "Official Store HP Xiaomi";
    await _helper.insert(StoreQuery.TABLE_NAME, _store.toMap());

    //akhir input data toko

    //input data produk
    Produk _produk = Produk(id: 0);
    _produk.id = 0;
    _produk.PRODUCTID = "SMA20";
    _produk.KODETOKO = "HPSM";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 2000000;
    _produk.NAMAPRODUK = "Samsung A20";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "SMA30";
    _produk.KODETOKO = "HPSM";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 2500000;
    _produk.NAMAPRODUK = "Samsung A30";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "SMA50";
    _produk.KODETOKO = "HPSM";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 3000000;
    _produk.NAMAPRODUK = "Samsung A50";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "SMA70";
    _produk.KODETOKO = "HPSM";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 4000000;
    _produk.NAMAPRODUK = "Samsung A70";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "SMA90";
    _produk.KODETOKO = "HPSM";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 5000000;
    _produk.NAMAPRODUK = "Samsung A90";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "IPH06";
    _produk.KODETOKO = "HPIP";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 2000000;
    _produk.NAMAPRODUK = "Iphone 6";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "IPH08";
    _produk.KODETOKO = "HPIP";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 3000000;
    _produk.NAMAPRODUK = "Iphone 8";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "IPHXS";
    _produk.KODETOKO = "HPIP";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 5000000;
    _produk.NAMAPRODUK = "Iphone XS";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "IPHXR";
    _produk.KODETOKO = "HPIP";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 6000000;
    _produk.NAMAPRODUK = "Iphone XR";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "IPH11";
    _produk.KODETOKO = "HPIP";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 8000000;
    _produk.NAMAPRODUK = "Iphone 11";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "XIA10";
    _produk.KODETOKO = "HPXI";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 3000000;
    _produk.NAMAPRODUK = "Xiaomi 10";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "XIA11";
    _produk.KODETOKO = "HPXI";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 3500000;
    _produk.NAMAPRODUK = "Xiaomi 11";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "XIA12";
    _produk.KODETOKO = "HPXI";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 4000000;
    _produk.NAMAPRODUK = "Xiaomi 12";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "XIA13";
    _produk.KODETOKO = "HPXI";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 5000000;
    _produk.NAMAPRODUK = "Xiaomi 13";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    _produk.id = 0;
    _produk.PRODUCTID = "XIA14";
    _produk.KODETOKO = "HPXI";
    _produk.GAMBARPRODUK = "";
    _produk.DESKRIPSIPRODUK = "";
    _produk.HARGAPRODUK = 6000000;
    _produk.NAMAPRODUK = "Xiaomi 14";
    _produk.STOK = 50;
    await _helper.insert(ProdukQuery.TABLE_NAME, _produk.toMap());

    return true;
  }
}
