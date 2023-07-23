import 'dart:io';
import 'dart:typed_data';

import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/notifier/notifier_transaksi.dart';
import 'package:ecommerce/notifier/notifier_user.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/view_login.dart';
import 'package:ecommerce/viewmodel/vm_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

class SuccessView extends StatefulWidget {
  String transID;

  SuccessView(this.transID);

  @override
  State<SuccessView> createState() => _SuccessViewState(this.transID);
}

class _SuccessViewState extends State<SuccessView> {
  String nama = "";
  String email = "";
  String nohp = "";
  double saldo = 0;

  String transID = '';

  List<dynamic> listTransaksiHeader = [];
  List<dynamic> listTransaksiDetail = [];

  _SuccessViewState(this.transID);

  var directory = "";
  var directoryComplete = "";
  File imgFile = File("");
  Uint8List pngBytes = Uint8List(0);
  GlobalKey _globalKey = new GlobalKey();

  Future<bool> _capturePng() async {
    String transid = transID;

    print("capture");
    RenderRepaintBoundary? boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image = await boundary!.toImage();
    directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    pngBytes = byteData!.buffer.asUint8List();
    print(pngBytes);
    imgFile = new File('$directory/screenshot$transid.png');
    directoryComplete = '$directory/screenshot$transid.png';
    imgFile.writeAsBytes(pngBytes);

    final result = await ImageGallerySaver.saveImage(pngBytes);

    print(result);
    print(imgFile);

    return true;
  }

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

  getTrans() async {
    vmTransaksi objTrans = new vmTransaksi();
    listTransaksiHeader = await objTrans.getTransaksiHeader(transID: transID);
    listTransaksiDetail = await objTrans.getTransaksiDetail(transID: transID);
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getTrans();

    final formatCurrency =
        NumberFormat.currency(locale: "id_ID", symbol: "Rp ", decimalDigits: 0);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();

          return true;
        },
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Transaksi Berhasil",
                        style: AppTheme.OpenSans400(17, Colors.white),
                      )
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                      color: Color(0xFFf6f6f6),
                      margin:
                          EdgeInsets.only(top: MySize.getScaledSizeHeight(20)),
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nama",
                                style: AppTheme.OpenSans400(12, Colors.black)),
                            Text(nama,
                                style: AppTheme.OpenSans500(12, Colors.black)),
                            // Text(),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email",
                                style: AppTheme.OpenSans400(12, Colors.black)),
                            Text(email,
                                style: AppTheme.OpenSans500(12, Colors.black)),
                            // Text(),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("NO HP",
                                style: AppTheme.OpenSans400(12, Colors.black)),
                            Text(nohp,
                                style: AppTheme.OpenSans500(12, Colors.black)),
                            // Text(),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              top: MySize.getScaledSizeHeight(20)),
                          // height: MySize.getScaledSizeHeight(200),
                          child: ListView.builder(
                              itemCount: listTransaksiDetail.length,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      color: Colors.white,
                                      margin: EdgeInsets.only(
                                          top: MySize.getScaledSizeHeight(10)),
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
                                                height:
                                                    MySize.getScaledSizeHeight(
                                                        50),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listTransaksiDetail[index]
                                                          ['PRODUCTNAME'],
                                                      style:
                                                          AppTheme.OpenSans600(
                                                              14,
                                                              Color(
                                                                  0xFF2B2730)),
                                                    ),
                                                    SizedBox(
                                                        height: MySize
                                                            .getScaledSizeHeight(
                                                                10)),
                                                    Text(
                                                      formatCurrency.format(
                                                          listTransaksiDetail[
                                                              index]['HARGA']),
                                                      style:
                                                          AppTheme.OpenSans600(
                                                              13,
                                                              Color(
                                                                  0xFF1F6E8C)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                              'Jumlah : ' +
                                                  listTransaksiDetail[index]
                                                          ['QTY']
                                                      .toString(),
                                              style: AppTheme.OpenSans600(
                                                  13, Color(0xFF1F6E8C)))
                                        ],
                                      )),
                                );
                              }),
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: AppTheme.OpenSans400(12, Colors.black)),
                            Text(
                                formatCurrency
                                    .format(listTransaksiHeader[0]["TOTAL"]),
                                style: AppTheme.OpenSans500(12, Colors.black)),
                            // Text(),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tanggal Transaksi",
                                style: AppTheme.OpenSans400(12, Colors.black)),
                            Text(listTransaksiHeader[0]["TRANSDATE"].toString(),
                                style: AppTheme.OpenSans500(12, Colors.black)),
                            // Text(),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Metode Pembayaran",
                                style: AppTheme.OpenSans400(12, Colors.black)),
                            Text(
                                listTransaksiHeader[0]["PAYMENTYPE"].toString(),
                                style: AppTheme.OpenSans500(12, Colors.black)),
                            // Text(),
                          ],
                        ),
                        SizedBox(height: MySize.getScaledSizeHeight(100)),
                      ])),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: AppTheme.ButtonHalfDownload(),
                          onPressed: () async {
                            bool statusCapture = false;
                            statusCapture = await _capturePng();

                            if (statusCapture == true) {
                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(""),
                                  content: Container(
                                    child: Wrap(
                                      children: [
                                        Column(
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 70,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                                height:
                                                    MySize.getScaledSizeHeight(
                                                        30)),
                                            Text(
                                              'Gambar berhasil di download, silahkan cek gallery',
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                                height:
                                                    MySize.getScaledSizeHeight(
                                                        30)),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    },
                                                    child: Text('Oke'),
                                                    style:
                                                        AppTheme.ButtonSubmit(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Icon(Icons.download, size: 30)),
                      SizedBox(width: MySize.getScaledSizeWidth(10)),
                      ElevatedButton(
                          style: AppTheme.ButtonHalfSubmit(),
                          onPressed: () async {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("Selesai",
                              style: AppTheme.OpenSans600(17, Colors.white))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ))),
      ),
    );
  }
}
