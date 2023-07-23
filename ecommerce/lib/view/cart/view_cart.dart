import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/model/model_cart.dart';
import 'package:ecommerce/model/model_transaksi.dart';
import 'package:ecommerce/notifier/notifier_cart.dart';
import 'package:ecommerce/notifier/notifier_produk.dart';
import 'package:ecommerce/notifier/notifier_user.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/cart/view_payment.dart';
import 'package:ecommerce/view/detail/view_success.dart';
import 'package:ecommerce/view/view_login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  CartView();

  @override
  State<CartView> createState() => _CartViewViewState();
}

class _CartViewViewState extends State<CartView> {
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

  String paymenttype = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartNotifier>(
        create: (context) => CartNotifier(),
        child: Builder(builder: (BuildContext context) {
          return Consumer<CartNotifier>(builder: (context, value, child) {
            List<dynamic> _lstCart = value.listValue();

            final formatCurrency = NumberFormat.currency(
                locale: "id_ID", symbol: "Rp ", decimalDigits: 0);

            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Scaffold(
                  body: Container(
                      child: Stack(
                children: [
                  Container(
                    height: MySize.getScaledSizeHeight(80),
                    decoration: BoxDecoration(
                      color: Color(0xFF01D5D9B),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: MySize.getScaledSizeHeight(40),
                            bottom: MySize.getScaledSizeHeight(0),
                            left: MySize.getScaledSizeWidth(20),
                            right: MySize.getScaledSizeWidth(20)),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop(true);
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
                                      Icons.arrow_back_ios_new_rounded,
                                      size: 15,
                                      color: Color(0xFF1D5D9B),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: MySize.getScaledSizeWidth(20)),
                            Text(
                              "Keranjang",
                              style: AppTheme.OpenSans400(17, Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MySize.getScaledSizeHeight(630),
                        margin: EdgeInsets.only(
                            top: MySize.getScaledSizeHeight(20)),
                        // padding: EdgeInsets.only(
                        //     left: MySize.getScaledSizeWidth(10),
                        //     right: MySize.getScaledSizeWidth(10)),
                        child: ListView.builder(
                            itemCount: _lstCart.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Card(
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        width: MySize.getScaledSizeWidth(140),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/default.png',
                                                  fit: BoxFit.contain,
                                                  height: MySize
                                                      .getScaledSizeHeight(50),
                                                  width:
                                                      MySize.getScaledSizeWidth(
                                                          50),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: MySize
                                                          .getScaledSizeWidth(
                                                              10)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        _lstCart[index]
                                                            ['PRODUCTNAME'],
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                16,
                                                                Color(
                                                                    0xFF2B2730)),
                                                      ),
                                                      SizedBox(
                                                          height: MySize
                                                              .getScaledSizeHeight(
                                                                  10)),
                                                      Text(
                                                        formatCurrency.format(
                                                            _lstCart[index]
                                                                ['HARGA']),
                                                        style: AppTheme
                                                            .OpenSans600(
                                                                15,
                                                                Color(
                                                                    0xFF1F6E8C)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Consumer<CartNotifier>(builder:
                                                (context, values, child) {
                                              int counts = values.getCount();
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                      style:
                                                          AppTheme.ButtonMin(),
                                                      onPressed: () async {
                                                        DateTime now =
                                                            DateTime.now();
                                                        String formattedDate =
                                                            DateFormat(
                                                                    'yyMMddkkmmss')
                                                                .format(now);

                                                        final DbHelper _helper =
                                                            new DbHelper();

                                                        Cart _cart =
                                                            Cart(id: 0);
                                                        _cart.id =
                                                            _lstCart[index]
                                                                ['id'];
                                                        _cart.PRODUCTID =
                                                            _lstCart[index]
                                                                ['PRODUCTID'];
                                                        _cart.PRODUCTNAME =
                                                            _lstCart[index]
                                                                ['PRODUCTNAME'];
                                                        _cart.HARGA =
                                                            _lstCart[index]
                                                                ['HARGA'];
                                                        _cart.QTY =
                                                            _lstCart[index]
                                                                    ['QTY'] -
                                                                1;
                                                        _cart.STATUS =
                                                            "KERANJANG";
                                                        _cart.NOHP = nohp;

                                                        if (_cart.QTY == 0) {
                                                          await _helper.delete(
                                                              CartQuery
                                                                  .TABLE_NAME,
                                                              _cart.id);
                                                        } else {
                                                          await _helper.update(
                                                              CartQuery
                                                                  .TABLE_NAME,
                                                              _cart.toMap());
                                                        }

                                                        Provider.of<CartNotifier>(
                                                                context,
                                                                listen: false)
                                                            .updateValue();
                                                      },
                                                      child: Icon(
                                                        Icons.minimize,
                                                        size: 15,
                                                      )),
                                                  Text(
                                                    _lstCart[index]['QTY']
                                                        .toString(),
                                                    style: AppTheme.OpenSans600(
                                                        12, Color(0xFF1F6E8C)),
                                                  ),
                                                  ElevatedButton(
                                                      style:
                                                          AppTheme.ButtonAdd(),
                                                      onPressed: () async {
                                                        DateTime now =
                                                            DateTime.now();
                                                        String formattedDate =
                                                            DateFormat(
                                                                    'yyMMddkkmmss')
                                                                .format(now);

                                                        final DbHelper _helper =
                                                            new DbHelper();

                                                        Cart _cart =
                                                            Cart(id: 0);
                                                        _cart.id =
                                                            _lstCart[index]
                                                                ['id'];
                                                        _cart.PRODUCTID =
                                                            _lstCart[index]
                                                                ['PRODUCTID'];
                                                        _cart.PRODUCTNAME =
                                                            _lstCart[index]
                                                                ['PRODUCTNAME'];
                                                        _cart.HARGA =
                                                            _lstCart[index]
                                                                ['HARGA'];
                                                        _cart.QTY =
                                                            _lstCart[index]
                                                                    ['QTY'] +
                                                                1;
                                                        _cart.STATUS =
                                                            "KERANJANG";
                                                        _cart.NOHP = nohp;

                                                        await _helper.update(
                                                            CartQuery
                                                                .TABLE_NAME,
                                                            _cart.toMap());

                                                        Provider.of<CartNotifier>(
                                                                context,
                                                                listen: false)
                                                            .updateValue();
                                                      },
                                                      child: Icon(
                                                        Icons.add,
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
                      Container(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                String payment = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentView(),
                                    ));

                                setState(() {
                                  paymenttype = payment;
                                });

                                print("cek payment");
                                print(paymenttype);
                              },
                              child: Container(
                                color: Colors.white,
                                margin: EdgeInsets.only(
                                  bottom: MySize.getScaledSizeHeight(5),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Metode Pembayaran",
                                        style: AppTheme.OpenSans400(
                                            13, Colors.black)),
                                    Row(
                                      children: [
                                        paymenttype == ''
                                            ? Container()
                                            : Text(paymenttype,
                                                style: AppTheme.OpenSans600(
                                                    13, Colors.black)),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 15,
                                          color: Color(0xFF1D5D9B),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  right: MySize.getScaledSizeWidth(10)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        height: MySize.getScaledSizeHeight(80),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Total",
                                                style: AppTheme.OpenSans400(
                                                    18, Colors.black),
                                              ),
                                              SizedBox(
                                                  height: MySize
                                                      .getScaledSizeHeight(5)),
                                              Text(
                                                formatCurrency
                                                    .format(value.getAMount()),
                                                style: AppTheme.OpenSans600(
                                                    20, Color(0xFF1D5D9B)),
                                              ),
                                            ])),
                                    ElevatedButton(
                                        style: AppTheme.ButtonCartSubmit(),
                                        onPressed: () async {
                                          DateTime now = DateTime.now();
                                          String formattedDate =
                                              DateFormat('yyMMddkkmmss')
                                                  .format(now);

                                          String transDate =
                                              DateFormat('yyyy-MM-dd kk:mm:ss')
                                                  .format(now);

                                          final DbHelper _helper =
                                              new DbHelper();

                                          dynamic objCartProvider =
                                              Provider.of<CartNotifier>(context,
                                                  listen: false);

                                          List<dynamic> lstCart =
                                              objCartProvider.listValue();

                                          print("lstCart");
                                          print(lstCart);

                                          Preferences objPreferences =
                                              Preferences();
                                          String NOHP =
                                              await objPreferences.getNoHP();

                                          Map<String, Object> objHeader =
                                              new Map<String, Object>();

                                          objHeader["id"] = 0;
                                          objHeader["TRANSID"] =
                                              'TRANS' + formattedDate;
                                          objHeader["TRANSDATE"] = transDate;
                                          objHeader["NOHP"] = NOHP;
                                          objHeader["PAYMENTYPE"] = paymenttype;
                                          objHeader["TOTAL"] =
                                              value.getAMount();
                                          objHeader["JUMLAHORDER"] =
                                              value.getCount();
                                          objHeader["NOTES"] = "Tes";

                                          String transid =
                                              'TRANS' + formattedDate;

                                          await _helper.insert(
                                              TransaksiQuery.TABLE_HEADER_NAME,
                                              objHeader);

                                          Map<String, Object> objDetail =
                                              new Map<String, Object>();

                                          List<dynamic> arrTransDetail = [];

                                          lstCart.forEach((element) async {
                                            print("lstCart");
                                            print(element["PRODUCTID"]!);
                                            objDetail =
                                                new Map<String, Object>();

                                            objDetail["id"] = element["id"]!;
                                            objDetail["TRANSID"] =
                                                'TRANS' + formattedDate;
                                            objDetail["PRODUCTID"] =
                                                element["PRODUCTID"]!;
                                            objDetail["NOHP"] = NOHP;
                                            objDetail["PRODUCTNAME"] =
                                                element["PRODUCTNAME"]!;
                                            objDetail["HARGA"] =
                                                element["HARGA"]!;
                                            objDetail["QTY"] = element["QTY"]!;

                                            arrTransDetail.add(objDetail);

                                            await _helper.insert(
                                                TransaksiQuery
                                                    .TABLE_DETAIL_NAME,
                                                objDetail);

                                            print("awal hapus");
                                            await _helper.delete(
                                                CartQuery.TABLE_NAME,
                                                element["id"]);

                                            Provider.of<CartNotifier>(context,
                                                    listen: false)
                                                .updateValue();
                                            print("akhir hapus");
                                          });

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SuccessView(objHeader,
                                                        arrTransDetail),
                                              ));
                                        },
                                        child: Text("Checkout",
                                            style: AppTheme.OpenSans600(
                                                17, Colors.white))),
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ))),
            );
          });
        }));
  }
}
