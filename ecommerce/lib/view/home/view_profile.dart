import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/notifier/notifier_cart.dart';
import 'package:ecommerce/notifier/notifier_transaksi.dart';
import 'package:ecommerce/notifier/notifier_user.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/cart/view_cart.dart';
import 'package:ecommerce/view/detail/view_success2.dart';
import 'package:ecommerce/view/view_login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  final BuildContext rootContext;

  ProfileView({Key? key, required this.rootContext}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
    return ChangeNotifierProvider<CartNotifier>(
        create: (context) => CartNotifier(),
        child: Builder(builder: (BuildContext context) {
          return ChangeNotifierProvider<TransaksiNotifier>(
              create: (context) => TransaksiNotifier(),
              child: Builder(builder: (BuildContext context) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: Scaffold(
                      body: Container(
                          child: Stack(
                    children: [
                      Container(
                        height: MySize.getScaledSizeHeight(209),
                        decoration: BoxDecoration(
                            color: Color(0xFF01D5D9B),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                      ),
                      Column(
                        children: [
                          Consumer<CartNotifier>(
                              builder: (context, values, child) {
                            return Container(
                              padding: EdgeInsets.only(
                                  top: MySize.getScaledSizeHeight(40),
                                  bottom: MySize.getScaledSizeHeight(40),
                                  left: MySize.getScaledSizeWidth(20),
                                  right: MySize.getScaledSizeWidth(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                              width: MySize.getScaledSizeWidth(
                                                  10)),
                                          Text(
                                            values.getCount().toString(),
                                            style: AppTheme.OpenSans400(
                                                15, Color(0xFF1D5D9B)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: MySize.getScaledSizeWidth(15)),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xFFe7b10a),
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () async {
                                              showExitPopup();
                                            },
                                            child: Icon(
                                              Icons.logout,
                                              size: 15,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          Container(
                              margin: EdgeInsets.only(
                                  left: MySize.getScaledSizeWidth(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(nama,
                                      style: AppTheme.OpenSans600(
                                          20, Colors.white))
                                ],
                              )),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Container(
                              margin: EdgeInsets.only(
                                  left: MySize.getScaledSizeWidth(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(email,
                                      style: AppTheme.OpenSans400(
                                          14, Colors.white))
                                ],
                              )),
                          SizedBox(height: MySize.getScaledSizeHeight(10)),
                          Container(
                              margin: EdgeInsets.only(
                                  left: MySize.getScaledSizeWidth(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(nohp,
                                      style: AppTheme.OpenSans400(
                                          14, Colors.white))
                                ],
                              )),
                          Consumer<TransaksiNotifier>(
                              builder: (context, value, child) {
                            List<dynamic> _lstTrans = value.listValue();
                            int count = _lstTrans.length;

                            final formatCurrency = NumberFormat.currency(
                                locale: "id_ID",
                                symbol: "Rp ",
                                decimalDigits: 0);

                            return count == 0
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: MySize.getScaledSizeHeight(150)),
                                    child: Text("Tidak ada transaksi",
                                        style: AppTheme.OpenSans600(
                                            17, Color(0xFF1D5D9B))),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: MySize.getScaledSizeHeight(25)),
                                    height: MySize.getScaledSizeHeight(550),
                                    width: double.infinity,
                                    child: ListView.builder(
                                        itemCount: _lstTrans.length,
                                        padding: EdgeInsets.zero,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SuccessView(_lstTrans[
                                                                  index]
                                                              ['TRANSID'])));
                                            },
                                            child: Card(
                                                child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    width: MySize
                                                        .getScaledSizeWidth(
                                                            140),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/default.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                              height: MySize
                                                                  .getScaledSizeHeight(
                                                                      50),
                                                              width: MySize
                                                                  .getScaledSizeWidth(
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
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        _lstTrans[index]
                                                                            [
                                                                            'TRANSID'],
                                                                        style: AppTheme.OpenSans600(
                                                                            15,
                                                                            Color(0xFF2B2730)),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              MySize.getScaledSizeWidth(20)),
                                                                      Text(
                                                                        _lstTrans[index]
                                                                            [
                                                                            'TRANSDATE'],
                                                                        style: AppTheme.OpenSans600(
                                                                            10,
                                                                            Color(0xFF2B2730)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height: MySize
                                                                          .getScaledSizeHeight(
                                                                              10)),
                                                                  Text(
                                                                    formatCurrency.format(
                                                                        _lstTrans[index]
                                                                            [
                                                                            'TOTAL']),
                                                                    style: AppTheme
                                                                        .OpenSans600(
                                                                            14,
                                                                            Color(0xFF1F6E8C)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ))),
                                          );
                                        }),
                                  );
                          })
                        ],
                      )
                    ],
                  ))),
                );
              }));
        }));
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Keluar Aplikasi',
              style: AppTheme.OpenSans600(17, Color(0xFF1D5D9B)),
            ),
            content: Container(
              child: Wrap(
                children: [
                  Column(
                    children: [
                      Text('Apakah anda yakin ingin keluar?'),
                      SizedBox(height: MySize.getScaledSizeHeight(15)),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: buttondialog,
                              onPressed: () async {
                                Preferences objPreferences = Preferences();
                                await objPreferences.SetLoginCredential(
                                  0,
                                  '',
                                  '',
                                  '',
                                  '',
                                  0,
                                  '',
                                );

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginView(),
                                    ));
                              },
                              //return true when click on "Yes"
                              child: Text('Yes'),
                            ),
                          ),
                          SizedBox(width: MySize.getScaledSizeWidth(5)),
                          Expanded(
                            child: ElevatedButton(
                              style: buttondialog,
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('No'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            actions: [],
          ),
        ) ??
        false;
  }

  final ButtonStyle buttondialog = ElevatedButton.styleFrom(
    primary: Color(0xFF01D5D9B),
    onPrimary: Colors.white,
    minimumSize: Size(370, 50),
    padding: EdgeInsets.only(left: 37, right: 37),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );
}
