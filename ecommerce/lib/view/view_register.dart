import 'package:ecommerce/helper/db_helper.dart';
import 'package:ecommerce/model/model_user.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/home/view_home.dart';
import 'package:ecommerce/view/view_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final hpController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("register");

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(
                    MySize.getScaledSizeWidth(37),
                    MySize.getScaledSizeHeight(105),
                    MySize.getScaledSizeWidth(37),
                    MySize.getScaledSizeHeight(30)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register Account",
                      style: AppTheme.OpenSans600(30, Color(0xFF1D5D9B)),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.010),
                    Text(
                      "Input all data to register",
                      style: AppTheme.OpenSans400(12, Color(0xFFe7b10a)),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.050),
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
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0040),
                                  Card(
                                    elevation: 0.3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.person,
                                                color: Color(0xFF1D5D9B),
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.030,
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: TextFormField(
                                              style: AppTheme.OpenSans400Italic(
                                                  15, Color(0xFF2C2948)),
                                              decoration: InputDecoration(
                                                hintText: 'Name',
                                              ),
                                              controller: usernameController,
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0040),
                                  Card(
                                    elevation: 0.3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.email_outlined,
                                                color: Color(0xFF1D5D9B),
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.030,
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: TextFormField(
                                              style: AppTheme.OpenSans400Italic(
                                                  15, Color(0xFF2C2948)),
                                              decoration: InputDecoration(
                                                hintText: 'Email',
                                              ),
                                              controller: emailController,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0040),
                                  Card(
                                    elevation: 0.3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.call,
                                                color: Color(0xFF1D5D9B),
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.030,
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: TextFormField(
                                              style: AppTheme.OpenSans400Italic(
                                                  15, Color(0xFF2C2948)),
                                              decoration: InputDecoration(
                                                hintText: 'No Handphone',
                                              ),
                                              controller: hpController,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0040),
                                  Card(
                                    elevation: 0.3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.lock,
                                                color: Color(0xFF1D5D9B),
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.030,
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: TextFormField(
                                              style: AppTheme.OpenSans400Italic(
                                                  15, Color(0xFF2C2948)),
                                              decoration: InputDecoration(
                                                hintText: 'Password',
                                              ),
                                              controller: passwordController,
                                              keyboardType: TextInputType.text,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0040),
                                  Card(
                                    elevation: 0.3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.password,
                                                color: Color(0xFF1D5D9B),
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.030,
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: TextFormField(
                                              style: AppTheme.OpenSans400Italic(
                                                  15, Color(0xFF2C2948)),
                                              decoration: InputDecoration(
                                                hintText: 'Confirm Password',
                                              ),
                                              controller:
                                                  confPasswordController,
                                              keyboardType: TextInputType.text,
                                              obscureText: _obscureText2,
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: TextButton(
                                                  onPressed: _toggle2,
                                                  child: new Icon(
                                                    _obscureText2
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
                                ],
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: MySize.getScaledSizeHeight(70)),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: AppTheme.ButtonSubmit(),
                              onPressed: () async {
                                String nama = usernameController.text;
                                String email = emailController.text;
                                String nohp = hpController.text;
                                String pass = passwordController.text;
                                String cpass = confPasswordController.text;

                                final DbHelper _helper = new DbHelper();

                                DateTime now = DateTime.now();
                                String dateNow =
                                    DateFormat('yyyy-MM-dd kk:mm:ss')
                                        .format(now);

                                if (_formKey.currentState!.validate()) {
                                  if (nama == '' ||
                                      email == '' ||
                                      nohp == '' ||
                                      pass == '' ||
                                      cpass == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Harap lengkapi data')));
                                  } else {
                                    if (pass != cpass) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Confirm Password tidak sama dengan Password')));
                                    } else {
                                      Map<String, Object> objUser =
                                          new Map<String, Object>();
                                      objUser["id"] = 0;
                                      objUser["NAMA"] = nama;
                                      objUser["EMAIL"] = email;
                                      objUser["NOHP"] = nohp;
                                      objUser["PASSWORD"] = pass;
                                      objUser["SALDO"] = 0;
                                      objUser["TGLDAFTAR"] = dateNow;

                                      await _helper.insert(
                                          UserQuery.TABLE_NAME, objUser);

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
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100)),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Icon(
                                                          Icons.check,
                                                          size: 70,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      color: Colors.green,
                                                    ),
                                                    SizedBox(
                                                        height: MySize
                                                            .getScaledSizeHeight(
                                                                30)),
                                                    Text(
                                                      'Akun berhasil dibuat',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                        height: MySize
                                                            .getScaledSizeHeight(
                                                                30)),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            LoginView(),
                                                                  ));
                                                            },
                                                            child: Text('Oke'),
                                                            style: AppTheme
                                                                .ButtonSubmit(),
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
                                  }
                                }
                              },
                              child: Text(
                                "Register",
                                style:
                                    AppTheme.OpenSans400(15, Color(0xFFFFFFFF)),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Sudah memiliki akun ? ",
                                      style: AppTheme.OpenSans400(
                                          13, Color(0xFF2a2a2a))),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginView(),
                                          ));
                                    },
                                    child: Text("Login",
                                        style: AppTheme.OpenSans400(
                                            13, Color(0xFFe7b10a))),
                                  )
                                ]),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
