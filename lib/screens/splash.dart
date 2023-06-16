import 'package:api_work2/screens/login.dart';
import 'package:api_work2/screens/page1.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    print(GetStorage().read("token"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>
        GetStorage().read("token") != null ? MainPage() : Page1()
        ),
      );

    });
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent.shade400, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Image.asset("images/Layer_2.png",width: 300,height: 300,),
      ),
    );
  }
}