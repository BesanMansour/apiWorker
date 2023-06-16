import 'package:api_work2/controller/createOrder.dart';
import 'package:api_work2/screens/home.dart';
import 'package:api_work2/screens/items.dart';
import 'package:api_work2/screens/login.dart';
import 'package:api_work2/screens/more.dart';
import 'package:api_work2/screens/order_done.dart';
import 'package:api_work2/screens/page1.dart';
import 'package:api_work2/screens/page2.dart';
import 'package:api_work2/screens/profile.dart';
import 'package:api_work2/screens/register.dart';
import 'package:api_work2/screens/splash.dart';
import 'package:api_work2/screens/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() {

  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GetStorage().read("token") != null ?HomePage():LoginPage(),
      home: Scaffold(
        body: SplashPage(),
      ),

    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(

      icon: Image.asset("images/logo.png",width: 30,height: 30,),
      label: 'Service',
      backgroundColor: Color(0xFF6FC8FB),
    ),
    BottomNavigationBarItem(
      icon: Image.asset("images/img_7.png",width: 30,height: 30),
      label: 'Order',
      backgroundColor: Color(0xFF6FC8FB),
    ),
    BottomNavigationBarItem(
      // icon: Image.asset("images/img_2.png",width: 30,height: 30),
      icon: Icon(Icons.person,size: 30,),
      label: 'User',
      backgroundColor: Color(0xFF6FC8FB),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz,color: Colors.white,),
      label: 'More',
      backgroundColor: Color(0xFF6FC8FB),

    ),
  ];

  List<Widget> screens = [
    HomePage(),
    ItemsDetailsPage(),
    ProfilePage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: items,
      ),
      body: screens[selectedIndex],
    );
  }
}
