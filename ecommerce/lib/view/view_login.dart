import 'package:ecommerce/data/data_dummy.dart';
import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/notifier/notifier_user.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/home/view_home.dart';
import 'package:ecommerce/view/home/view_mainmenu.dart';
import 'package:ecommerce/view/view_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("login");

    return ChangeNotifierProvider<UserNotifier>(
      create: (context) => UserNotifier(),
      child: Builder(builder: (BuildContext context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Consumer<UserNotifier>(builder: (_, value, __) {
              return Container(
                  margin: EdgeInsets.fromLTRB(
                      MySize.getScaledSizeWidth(37),
                      MySize.getScaledSizeHeight(105),
                      MySize.getScaledSizeWidth(37),
                      MySize.getScaledSizeHeight(30)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        width: MySize.getScaledSizeWidth(200), //160
                        image: AssetImage('assets/images/shopedia.png'),
                      ),
                      // Text(
                      //   "Login",
                      //   style: AppTheme.OpenSans600(30, Color(0xFF008199)),
                      // ),
                      // SizedBox(height: MySize.getScaledSizeHeight(10)),
                      // Text(
                      //   "Input your username and password",
                      //   style: AppTheme.OpenSans400(12, Color(0xFF008199)),
                      // ),
                      SizedBox(height: MySize.getScaledSizeHeight(30)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Container(
                            child: Form(
                              key: _formKey,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    inputDecorationTheme:
                                        AppTheme.loginDecorationTheme()),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      elevation: 0.3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                MySize.getScaledSizeWidth(15)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Color(0xFF1D5D9B),
                                                )),
                                            SizedBox(
                                                width:
                                                    MySize.getScaledSizeWidth(
                                                        10)),
                                            Expanded(
                                              flex: 8,
                                              child: TextFormField(
                                                style:
                                                    AppTheme.OpenSans400Italic(
                                                        15, Color(0xFF2C2948)),
                                                decoration: InputDecoration(
                                                  hintText: 'No Handphone',
                                                ),
                                                controller: usernameController,
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: MySize.getScaledSizeHeight(10)),
                                    Card(
                                      elevation: 0.3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                MySize.getScaledSizeWidth(15)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.lock,
                                                  color: Color(0xFF1D5D9B),
                                                )),
                                            SizedBox(
                                              width:
                                                  MySize.getScaledSizeWidth(10),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: TextFormField(
                                                style:
                                                    AppTheme.OpenSans400Italic(
                                                        15, Color(0xFF2C2948)),
                                                decoration: InputDecoration(
                                                  hintText: 'Password',
                                                ),
                                                controller: passwordController,
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: _obscureText,
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: TextButton(
                                                    onPressed: _toggle,
                                                    child: new Icon(
                                                      _obscureText
                                                          ? Icons
                                                              .remove_red_eye_outlined
                                                          : Icons
                                                              .remove_red_eye_sharp,
                                                      color: Color(0xFF1D5D9B),
                                                    ))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: MySize.getScaledSizeHeight(70)),
                                    ElevatedButton(
                                        style: AppTheme.ButtonSubmit(),
                                        onPressed: () async {
                                          String nohp = usernameController.text;
                                          String pass = passwordController.text;

                                          await Provider.of<UserNotifier>(
                                                  context,
                                                  listen: false)
                                              .login(nohp, pass);

                                          List<dynamic> _lstUser =
                                              value.listValue();

                                          print("Cek login");
                                          print(_lstUser.length);
                                          print(_lstUser);

                                          if (_lstUser.length > 0) {
                                            Preferences objPreferences =
                                                Preferences();
                                            for (int i = 0;
                                                i < _lstUser.length;
                                                i++) {
                                              print("disini oy");
                                              await objPreferences
                                                  .SetLoginCredential(
                                                _lstUser[i]["id"],
                                                _lstUser[i]["NAMA"],
                                                _lstUser[i]["EMAIL"],
                                                _lstUser[i]["NOHP"],
                                                _lstUser[i]["PASSWORD"],
                                                _lstUser[i]["SALDO"],
                                                _lstUser[i]["TGLDAFTAR"],
                                              );
                                            }

                                            DataDummy objData = DataDummy();
                                            await objData.setData();

                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainMenuView()));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Akun tidak ditemukan')));
                                          }
                                        },
                                        child: Text(
                                          "Login",
                                          style: AppTheme.OpenSans400(
                                              15, Color(0xFFFFFFFF)),
                                        )),
                                    SizedBox(
                                        height: MySize.getScaledSizeHeight(20)),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Belum memiliki akun ? ",
                                              style: AppTheme.OpenSans400(
                                                  13, Color(0xFF2a2a2a))),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterView(),
                                                  ));
                                            },
                                            child: Text("Daftar",
                                                style: AppTheme.OpenSans400(
                                                    14, Color(0xFFe7b10a))),
                                          )
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ));
            }),
          ),
        );
      }),
    );
  }
}
