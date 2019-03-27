import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:ygyg_flutter/blocs/application_bloc.dart';
import 'package:ygyg_flutter/blocs/bloc_provider.dart';
import 'package:ygyg_flutter/data/net/dio_util.dart';
import 'package:ygyg_flutter/blocs/main_bloc.dart';
import 'package:ygyg_flutter/ui/pages/top_page.dart';
import 'package:ygyg_flutter/ui/pages/home.dart';
import 'package:ygyg_flutter/ui/pages/classify.dart';
import 'package:ygyg_flutter/ui/pages/program.dart';
import 'package:ygyg_flutter/ui/pages/special.dart';
import 'package:ygyg_flutter/ui/pages/me.dart';

void main() =>
    runApp(BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider(child: Main(), bloc: MainBloc()),
    ));

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    );
  }


}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '分类', '', '专题', '我的'];
  var pageList = [Home(), Classify(), Program(), Special(), Me()];

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }


  @override
  void initState() {
    super.initState();
    _init();
    _initListener();
  }

  void _init() {
//    DioUtil.openDebug();
    BaseOptions options = DioUtil.getDefOptions();
//    options.baseUrl = "http://59.110.164.214:8024/";
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xFFB4A078)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xFF5C5C5C)));
    }
  }

  Container getTabTitleCenter() {
    return new Container(height: 0.0);
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  Image getTabImageCenter(path) {
    return new Image.asset(path, width: 47.0, height: 39.0);
  }

  void initData() {
    tabImages = [
      [
        getTabImage('assets/images/ic_home_nav_icon_gray.png'),
        getTabImage('assets/images/ic_home_nav_icon.png'),
      ],
      [
        getTabImage('assets/images/ic_classify_nav_icon_gray.png'),
        getTabImage('assets/images/ic_classify_nav_icon.png'),
      ],
      [
        getTabImageCenter('assets/images/ic_program_nav_icon.png'),
        getTabImageCenter('assets/images/ic_program_nav_icon.png'),
      ],
      [
        getTabImage('assets/images/ic_special_nav_icon_gray.png'),
        getTabImage('assets/images/ic_special_nav_icon.png'),
      ],
      [
        getTabImage('assets/images/ic_me_nav_icon_gray.png'),
        getTabImage('assets/images/ic_me_nav_icon.png'),
      ]
    ];


//    _bodys = [
//      new HomePage(),
//      new ShopPage(),
//      new MsgPage(),
//      new MyPage()
//    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return Scaffold(
      body: pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitleCenter()),
            BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
            BottomNavigationBarItem(icon: getTabIcon(4), title: getTabTitle(4)),
          ],
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;





  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        brightness: Brightness.light, elevation: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}


