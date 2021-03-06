import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fryo/src/screens/MainInfoScreen.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/services/ApplicationBloc.dart';
import 'package:fryo/src/services/DatabaseService.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:fryo/src/services/DialysisInfoService.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fryo/src/shared/globals.dart' as globals;
import 'package:fryo/src/models/MyUser.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fryo/src/screens/wrapper.dart';
import 'package:fryo/src/services/AuthService.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseService().getList();
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
          title: 'DialysisNow',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MyStatefulWidget(),//, // just for testing
        // routes: <String, WidgetBuilder> {
        //   '/signup': (BuildContext context) =>  SignUpPage(),
        //   '/signin': (BuildContext context) =>  SignInPage(),
        //   '/dashboard': (BuildContext context) => Dashboard(),
        //   '/productPage': (BuildContext context) => ProductPage(),
        // },
      )
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final mainInfo = new MainInfoScreen();
  int _selectedIndex = 1;
  static List<Widget> _widgetOptions = globals.widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialysisNow'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Fryo.search),
              label: 'Search',
              //style: tabLinkStyle,
              ),
          BottomNavigationBarItem(
              icon: Icon(Fryo.star),
              label: 'Main Center',
              //style: tabLinkStyle,
              ),
          BottomNavigationBarItem(
              icon: Icon(Fryo.alarm),
              label:'Resources',
              //style: tabLinkStyle,
              ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green[600],
        onTap: _onItemTapped,
      ),
    /*return StreamProvider<User?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      )
      title: 'Fryo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
     //, // just for testing
      // routes: <String, WidgetBuilder> {
      //   '/signup': (BuildContext context) =>  SignUpPage(),
      //   '/signin': (BuildContext context) =>  SignInPage(),
      //   '/dashboard': (BuildContext context) => Dashboard(),
      //   '/productPage': (BuildContext context) => ProductPage(),
      // },*/
    );
  }
}
