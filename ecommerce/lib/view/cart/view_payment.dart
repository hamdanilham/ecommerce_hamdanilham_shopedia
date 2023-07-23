import 'dart:io';

import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentView extends StatelessWidget {
  late ThemeData themeData;
  TextEditingController editingController = TextEditingController();
  Preferences objPreferences = Preferences();

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    final formatCurrency =
        NumberFormat.currency(locale: "id_ID", symbol: "Rp ", decimalDigits: 0);

    print("Build HutangCustomerState");

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Stack(
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
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        "Pembayaran",
                        style: AppTheme.OpenSans400(17, Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 8 * MySize.scaleFactorWidth,
                        right: 8 * MySize.scaleFactorWidth,
                        bottom: 12 * MySize.scaleFactorHeight),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        GridView.count(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            crossAxisCount: 2,
                            padding: EdgeInsets.fromLTRB(
                                25 * MySize.scaleFactorWidth,
                                10 * MySize.scaleFactorHeight,
                                25 * MySize.scaleFactorWidth,
                                0 * MySize.scaleFactorHeight),
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.15,
                            crossAxisSpacing: 16,
                            children: <Widget>[
                              PaymentItem(
                                title: "Cash On Delivery",
                                onTap: () {
                                  Navigator.pop(context, "Cash On Delivery");
                                },
                                lebar: 68 * MySize.scaleFactorWidth,
                                panjang: 48 * MySize.scaleFactorHeight,
                                spacePicDn: 10 * MySize.scaleFactorHeight,
                                spaceTextUp: 15 * MySize.scaleFactorHeight,
                              ),
                              PaymentItem(
                                icon: './assets/images/debitcard.png',
                                title: "Debit Card",
                                onTap: () {
                                  Navigator.pop(context, "Debit Card");
                                },
                                lebar: 66 * MySize.scaleFactorWidth,
                                panjang: 63 * MySize.scaleFactorHeight,
                                spacePicDn: 10 * MySize.scaleFactorHeight,
                                spaceTextUp: 15 * MySize.scaleFactorHeight,
                              ),
                              PaymentItem(
                                icon: './assets/images/creditcard.png',
                                title: "Credit Card",
                                onTap: () {
                                  Navigator.pop(context, "Credit Card");
                                },
                                lebar: 70 * MySize.scaleFactorWidth,
                                panjang: 53 * MySize.scaleFactorHeight,
                                spacePicDn: 10 * MySize.scaleFactorHeight,
                                spaceTextUp: 15 * MySize.scaleFactorHeight,
                              ),
                              PaymentItem(
                                icon: './assets/images/pinjaman.png',
                                title: "Transfer",
                                onTap: () {
                                  Navigator.pop(context, "Transfer");
                                },
                                lebar: 70 * MySize.scaleFactorWidth,
                                panjang: 71 * MySize.scaleFactorHeight,
                                spacePicDn: 10 * MySize.scaleFactorHeight,
                                spaceTextUp: 15 * MySize.scaleFactorHeight,
                              ),
                              PaymentItem(
                                icon: './assets/images/emoney.png',
                                title: "Qris",
                                onTap: () {
                                  Navigator.pop(context, "Qris");
                                },
                                lebar: 40 * MySize.scaleFactorWidth,
                                panjang: 71 * MySize.scaleFactorHeight,
                                spacePicDn: 10 * MySize.scaleFactorHeight,
                                spaceTextUp: 15 * MySize.scaleFactorHeight,
                              ),
                            ]),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  final String? title, icon;
  final IconData? iconData;
  final Color? iconColor, backgroundColor, textColor, borderColor;

  final double? lebar;
  final double? panjang;
  final double? spacePicUp;
  final double? spacePicDn;
  final double? spaceTextUp;

  final VoidCallback onTap;

  const PaymentItem(
      {Key? key,
      required this.title,
      required this.onTap,
      this.icon,
      this.iconData,
      this.iconColor,
      this.backgroundColor,
      this.textColor,
      this.borderColor,
      this.lebar,
      this.panjang,
      this.spacePicUp,
      this.spacePicDn,
      this.spaceTextUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return InkWell(
      onTap: () async {
        this.onTap();
      },
      child: Container(
        width: 170 * MySize.scaleFactorWidth,
        height: 166 * MySize.scaleFactorHeight,
        // margin: EdgeInsets.only(top: spacePicUp! * MySize.scaleFactorHeight),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          border: Border.all(width: 1.2, color: Colors.white70),
          boxShadow: [
            BoxShadow(color: Color(0xFF8A959E).withOpacity(0.15), blurRadius: 5)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MySize.getScaledSizeHeight(spaceTextUp!),
            ),
            Text(
              title!,
              style: AppTheme.OpenSans600(15, Color(0xFF3c3c3c)),
            )
          ],
        ),
      ),
    );
  }
}
