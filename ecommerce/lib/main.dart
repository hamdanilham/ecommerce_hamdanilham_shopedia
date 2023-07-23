import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/notifier/notifier_apptheme.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/view/home/view_home.dart';
import 'package:ecommerce/view/home/view_mainmenu.dart';
import 'package:ecommerce/view/view_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Preferences objPreferences = Preferences();

    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: FutureBuilder<String?>(
              future: objPreferences.getEmail(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                bool statusLogin = false;
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    if (snapshot.data != "") {
                      statusLogin = true;
                    }

                    if (snapshot.connectionState == ConnectionState.done) {}

                    if (statusLogin) {
                      return MainMenuView();
                    } else {
                      return SplashView();
                    }
                  }
                }
                return const Center(child: CircularProgressIndicator());
              },
            ));
      },
    );
  }
}
