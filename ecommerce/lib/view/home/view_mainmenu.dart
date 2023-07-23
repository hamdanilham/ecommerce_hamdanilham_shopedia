import 'package:ecommerce/helper/shared_preferences.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/home/view_home.dart';
import 'package:ecommerce/view/home/view_profile.dart';
import 'package:flutter/material.dart';

class MainMenuView extends StatefulWidget {
  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView>
    with
        // AutomaticKeepAliveClientMixin {
        SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;

      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });

    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    print("build mainmenu");

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      // child: WillPopScope(
      //   onWillPop: showExitPopup,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            shape: CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                color: themeData.bottomAppBarTheme.color,
                boxShadow: [
                  BoxShadow(
                    color: themeData.cardTheme.shadowColor!.withAlpha(40),
                    blurRadius: 3,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                  top: MySize.getScaledSizeHeight(12),
                  bottom: MySize.getScaledSizeHeight(12)),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: themeData.colorScheme.primary,
                tabs: <Widget>[
                  Container(
                    child: (_currentIndex == 0)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: Color(0xFFe7b10a),
                              ),
                              Text(
                                'Beranda',
                                style:
                                    AppTheme.OpenSans600(11, Color(0xFFe7b10a)),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: Color(0xFF87859A),
                              ),
                              Text(
                                'Beranda',
                                style:
                                    AppTheme.OpenSans600(11, Color(0xFF87859A)),
                              ),
                            ],
                          ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.only(right: MySize.getScaledSizeWidth(24)),
                      child: (_currentIndex == 1)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  color: Color(0xFF1D5D9B),
                                ),
                                Text(
                                  'Akun',
                                  style: AppTheme.OpenSans600(
                                      11, Color(0xFF1D5D9B)),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  color: Color(0xFF87859A),
                                ),
                                Text(
                                  'Akun',
                                  style: AppTheme.OpenSans600(
                                      11, Color(0xFF87859A)),
                                ),
                              ],
                            )),
                ],
              ),
            )),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            HomeView(rootContext: context),
            ProfileView(
              rootContext: context,
            ),
          ],
        ),
      ),
      // ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Keluar Aplikasi'),
            // content: Text('Do you want to exit an App?'),
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
                              onPressed: () {
                                Preferences objPreferences = Preferences();

                                Navigator.of(context).pop(true);
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             WelcomePageWidget()));
                              },
                              //return true when click on "Yes"
                              child: Text('Yes'),
                            ),
                          ),
                          SizedBox(width: MySize.getScaledSizeWidth(5)),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              //return false when click on "NO"
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
