import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/view_login.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    splashScreen(context);
    super.initState();
  }

  Future splashScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    print("splash");
    MySize().init(context);

    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MySize.getScaledSizeWidth(10),
                      right: MySize.getScaledSizeWidth(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            width: MySize.getScaledSizeWidth(200), //160
                            image: AssetImage('assets/images/shopedia.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ))));
  }
}
