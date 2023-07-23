import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/model/model_cart.dart';
import 'package:ecommerce/notifier/notifier_cart.dart';
import 'package:ecommerce/notifier/notifier_produk.dart';
import 'package:ecommerce/notifier/notifier_user.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/cart/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  final BuildContext rootContext;

  HomeView({Key? key, required this.rootContext}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String nama = "";
  String email = "";
  String nohp = "";
  double saldo = 0;

  getProfile() async {
    Preferences objPreferences = new Preferences();
    nama = await objPreferences.getNama();
    email = await objPreferences.getEmail();
    nohp = await objPreferences.getNoHP();
    saldo = await objPreferences.getSaldo();

    setState(() {
      nama;
      email;
      nohp;
      saldo;
    });
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("cek saldo");
    print(saldo);

    return ChangeNotifierProvider<ProdukNotifier>(
        create: (context) => ProdukNotifier(),
        child: Builder(builder: (BuildContext context) {
          return ChangeNotifierProvider<CartNotifier>(
              create: (context) => CartNotifier(),
              child: Builder(builder: (BuildContext context) {
                // Provider.of<CartNotifier>(context, listen: false).updateValue();

                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: Scaffold(
                      body: ListView(children: [
                    Stack(
                      children: [
                        Container(
                          height: MySize.getScaledSizeHeight(209),
                          decoration: BoxDecoration(
                              color: Color(0xFF01D5D9B),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                        ),
                        Consumer<CartNotifier>(
                            builder: (context, values, child) {
                          return Container(
                            padding: EdgeInsets.only(
                                top: MySize.getScaledSizeHeight(15),
                                bottom: MySize.getScaledSizeHeight(40),
                                left: MySize.getScaledSizeWidth(20),
                                right: MySize.getScaledSizeWidth(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  nama,
                                  style: AppTheme.OpenSans400(15, Colors.white),
                                ),
                                SizedBox(width: MySize.getScaledSizeWidth(15)),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CartView(),
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 15,
                                          color: Color(0xFF1D5D9B),
                                        ),
                                        SizedBox(
                                            width:
                                                MySize.getScaledSizeWidth(10)),
                                        Text(
                                          values.getCount().toString(),
                                          style: AppTheme.OpenSans400(
                                              15, Color(0xFF1D5D9B)),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        MoneyCard(saldo),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: MySize.getScaledSizeHeight(10)),
                        Consumer<ProdukNotifier>(
                          builder: (context, value, child) {
                            List<dynamic> _lstProduk = value.listValueSM();
                            List<dynamic> _lstProduk2 = value.listValueIP();
                            List<dynamic> _lstProduk3 = value.listValueXI();

                            final formatCurrency = NumberFormat.currency(
                                locale: "id_ID",
                                symbol: "Rp ",
                                decimalDigits: 0);

                            print("cek count euy");
                            print(_lstProduk.length);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        left: MySize.getScaledSizeWidth(20),
                                        right: MySize.getScaledSizeWidth(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Samsung",
                                          style: AppTheme.OpenSans600(
                                              20, Color(0xFF2B2730)),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      left: MySize.getScaledSizeWidth(20),
                                      right: MySize.getScaledSizeWidth(20)),
                                  height: MySize.getScaledSizeHeight(275),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _lstProduk.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                              child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  width:
                                                      MySize.getScaledSizeWidth(
                                                          140),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/default.png',
                                                        fit: BoxFit.contain,
                                                        height: MySize
                                                            .getScaledSizeHeight(
                                                                120),
                                                        width: MySize
                                                            .getScaledSizeWidth(
                                                                120),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  10)),
                                                      Text(
                                                        _lstProduk[index]
                                                            ['NAMAPRODUK'],
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                14,
                                                                Color(
                                                                    0xFF2B2730)),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  5)),
                                                      Text(
                                                        'Stok : ' +
                                                            _lstProduk[index]
                                                                    ['STOK']
                                                                .toString(),
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                12,
                                                                Color(
                                                                    0xFF2B2730)),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  5)),
                                                      Text(
                                                        formatCurrency.format(
                                                            _lstProduk[index][
                                                                'HARGAPRODUK']),
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                14,
                                                                Color(
                                                                    0xFF1F6E8C)),
                                                      ),
                                                      Consumer<CartNotifier>(
                                                          builder: (context,
                                                              values, child) {
                                                        int counts =
                                                            values.getCount();
                                                        return Column(
                                                          children: [
                                                            ElevatedButton(
                                                                style: AppTheme
                                                                    .ButtonCart(),
                                                                onPressed:
                                                                    () async {
                                                                  DateTime now =
                                                                      DateTime
                                                                          .now();
                                                                  String
                                                                      formattedDate =
                                                                      DateFormat(
                                                                              'yyMMddkkmmss')
                                                                          .format(
                                                                              now);

                                                                  final DbHelper
                                                                      _helper =
                                                                      new DbHelper();

                                                                  Cart _cart =
                                                                      Cart(
                                                                          id: 0);
                                                                  _cart.id = 0;
                                                                  _cart.PRODUCTID =
                                                                      _lstProduk[
                                                                              index]
                                                                          [
                                                                          'PRODUCTID'];
                                                                  _cart.PRODUCTNAME =
                                                                      _lstProduk[
                                                                              index]
                                                                          [
                                                                          'NAMAPRODUK'];
                                                                  _cart.HARGA =
                                                                      _lstProduk[
                                                                              index]
                                                                          [
                                                                          'HARGAPRODUK'];
                                                                  _cart.QTY = 1;
                                                                  _cart.STATUS =
                                                                      "KERANJANG";
                                                                  _cart.NOHP =
                                                                      nohp;

                                                                  await _helper.insert(
                                                                      CartQuery
                                                                          .TABLE_NAME,
                                                                      _cart
                                                                          .toMap());

                                                                  // ScaffoldMessenger.of(
                                                                  //         context)
                                                                  //     .showSnackBar(SnackBar(
                                                                  //         content:
                                                                  //             Text('Berhasil dimasukan ke keranjang')));

                                                                  Provider.of<CartNotifier>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .updateValue();
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .shopping_cart_outlined,
                                                                  size: 15,
                                                                )),
                                                          ],
                                                        );
                                                      })
                                                    ],
                                                  ))),
                                        );
                                      }),
                                ),
                                SizedBox(
                                    height: MySize.getScaledSizeHeight(20)),
                                Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        left: MySize.getScaledSizeWidth(20),
                                        right: MySize.getScaledSizeWidth(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Iphone",
                                          style: AppTheme.OpenSans600(
                                              20, Color(0xFF2B2730)),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      left: MySize.getScaledSizeWidth(20),
                                      right: MySize.getScaledSizeWidth(20)),
                                  height: MySize.getScaledSizeHeight(275),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _lstProduk.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                              child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  width:
                                                      MySize.getScaledSizeWidth(
                                                          140),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/default.png',
                                                        fit: BoxFit.contain,
                                                        height: MySize
                                                            .getScaledSizeHeight(
                                                                120),
                                                        width: MySize
                                                            .getScaledSizeWidth(
                                                                120),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  10)),
                                                      Text(
                                                        _lstProduk2[index]
                                                            ['NAMAPRODUK'],
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                14,
                                                                Color(
                                                                    0xFF2B2730)),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  5)),
                                                      Text(
                                                        'Stok : ' +
                                                            _lstProduk2[index]
                                                                    ['STOK']
                                                                .toString(),
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                12,
                                                                Color(
                                                                    0xFF2B2730)),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  5)),
                                                      Text(
                                                        formatCurrency.format(
                                                            _lstProduk2[index][
                                                                'HARGAPRODUK']),
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                14,
                                                                Color(
                                                                    0xFF1F6E8C)),
                                                      ),
                                                      Consumer<CartNotifier>(
                                                          builder: (context,
                                                              values, child) {
                                                        int counts =
                                                            values.getCount();
                                                        return Column(
                                                          children: [
                                                            ElevatedButton(
                                                                style: AppTheme
                                                                    .ButtonCart(),
                                                                onPressed:
                                                                    () async {
                                                                  DateTime now =
                                                                      DateTime
                                                                          .now();
                                                                  String
                                                                      formattedDate =
                                                                      DateFormat(
                                                                              'yyMMddkkmmss')
                                                                          .format(
                                                                              now);

                                                                  final DbHelper
                                                                      _helper =
                                                                      new DbHelper();

                                                                  Cart _cart =
                                                                      Cart(
                                                                          id: 0);
                                                                  _cart.id = 0;
                                                                  _cart.PRODUCTID =
                                                                      _lstProduk2[
                                                                              index]
                                                                          [
                                                                          'PRODUCTID'];
                                                                  _cart.PRODUCTNAME =
                                                                      _lstProduk2[
                                                                              index]
                                                                          [
                                                                          'NAMAPRODUK'];
                                                                  _cart.HARGA =
                                                                      _lstProduk2[
                                                                              index]
                                                                          [
                                                                          'HARGAPRODUK'];
                                                                  _cart.QTY = 1;
                                                                  _cart.STATUS =
                                                                      "KERANJANG";
                                                                  _cart.NOHP =
                                                                      nohp;

                                                                  await _helper.insert(
                                                                      CartQuery
                                                                          .TABLE_NAME,
                                                                      _cart
                                                                          .toMap());

                                                                  // ScaffoldMessenger.of(
                                                                  //         context)
                                                                  //     .showSnackBar(SnackBar(
                                                                  //         content:
                                                                  //             Text('Berhasil dimasukan ke keranjang')));

                                                                  Provider.of<CartNotifier>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .updateValue();
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .shopping_cart_outlined,
                                                                  size: 15,
                                                                )),
                                                          ],
                                                        );
                                                      })
                                                    ],
                                                  ))),
                                        );
                                      }),
                                ),
                                SizedBox(
                                    height: MySize.getScaledSizeHeight(20)),
                                Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        left: MySize.getScaledSizeWidth(20),
                                        right: MySize.getScaledSizeWidth(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Xiaomi",
                                          style: AppTheme.OpenSans600(
                                              20, Color(0xFF2B2730)),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      left: MySize.getScaledSizeWidth(20),
                                      right: MySize.getScaledSizeWidth(20)),
                                  height: MySize.getScaledSizeHeight(275),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _lstProduk.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                              child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  width:
                                                      MySize.getScaledSizeWidth(
                                                          140),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/default.png',
                                                        fit: BoxFit.contain,
                                                        height: MySize
                                                            .getScaledSizeHeight(
                                                                120),
                                                        width: MySize
                                                            .getScaledSizeWidth(
                                                                120),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  10)),
                                                      Text(
                                                        _lstProduk3[index]
                                                            ['NAMAPRODUK'],
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                14,
                                                                Color(
                                                                    0xFF2B2730)),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  5)),
                                                      Text(
                                                        'Stok : ' +
                                                            _lstProduk3[index]
                                                                    ['STOK']
                                                                .toString(),
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                12,
                                                                Color(
                                                                    0xFF2B2730)),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  5)),
                                                      Text(
                                                        formatCurrency.format(
                                                            _lstProduk3[index][
                                                                'HARGAPRODUK']),
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                14,
                                                                Color(
                                                                    0xFF1F6E8C)),
                                                      ),
                                                      Consumer<CartNotifier>(
                                                          builder: (context,
                                                              values, child) {
                                                        int counts =
                                                            values.getCount();
                                                        return Column(
                                                          children: [
                                                            ElevatedButton(
                                                                style: AppTheme
                                                                    .ButtonCart(),
                                                                onPressed:
                                                                    () async {
                                                                  DateTime now =
                                                                      DateTime
                                                                          .now();
                                                                  String
                                                                      formattedDate =
                                                                      DateFormat(
                                                                              'yyMMddkkmmss')
                                                                          .format(
                                                                              now);

                                                                  final DbHelper
                                                                      _helper =
                                                                      new DbHelper();

                                                                  Cart _cart =
                                                                      Cart(
                                                                          id: 0);
                                                                  _cart.id = 0;
                                                                  _cart.PRODUCTID =
                                                                      _lstProduk3[
                                                                              index]
                                                                          [
                                                                          'PRODUCTID'];
                                                                  _cart.PRODUCTNAME =
                                                                      _lstProduk3[
                                                                              index]
                                                                          [
                                                                          'NAMAPRODUK'];
                                                                  _cart.HARGA =
                                                                      _lstProduk3[
                                                                              index]
                                                                          [
                                                                          'HARGAPRODUK'];
                                                                  _cart.QTY = 1;
                                                                  _cart.STATUS =
                                                                      "KERANJANG";
                                                                  _cart.NOHP =
                                                                      nohp;

                                                                  await _helper.insert(
                                                                      CartQuery
                                                                          .TABLE_NAME,
                                                                      _cart
                                                                          .toMap());

                                                                  Provider.of<CartNotifier>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .updateValue();
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .shopping_cart_outlined,
                                                                  size: 15,
                                                                )),
                                                          ],
                                                        );
                                                      })
                                                    ],
                                                  ))),
                                        );
                                      }),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ])),
                );
              }));
        }));
  }
}

class MoneyCard extends StatelessWidget {
  double saldo;

  MoneyCard(this.saldo);

  final formatCurrency =
      NumberFormat.currency(locale: "id_ID", symbol: "Rp ", decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MySize.getScaledSizeHeight(100),
          left: MySize.getScaledSizeWidth(20),
          right: MySize.getScaledSizeWidth(20)),
      child: Card(
        child: Container(
            padding: EdgeInsets.only(
                top: MySize.getScaledSizeHeight(15),
                bottom: MySize.getScaledSizeHeight(15),
                left: MySize.getScaledSizeWidth(15),
                right: MySize.getScaledSizeWidth(15)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {},
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text('Saldo',
                              //     style: AppTheme.OpenSans400(
                              //         17, Color(0xFF1D5D9B))),
                              // SizedBox(
                              //   height: MySize.getScaledSizeHeight(3),
                              // ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.credit_card_rounded,
                                    color: Color(0xFF1D5D9B),
                                    size: 30,
                                  ),
                                  SizedBox(
                                      width: MySize.getScaledSizeWidth(10)),
                                  Text(
                                    formatCurrency.format(saldo),
                                    style: AppTheme.OpenSans400LS(
                                        17, Color(0xFF02B2730), 0.43),
                                  )
                                ],
                              ),
                            ]))),
              ],
            )),
      ),
    );
  }
}
