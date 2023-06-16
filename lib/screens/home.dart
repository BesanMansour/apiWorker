import 'package:api_work2/controller/AllWork.dart';
import 'package:api_work2/controller/api_controller.dart';
import 'package:api_work2/controller/createOrder.dart';
import 'package:api_work2/model/dataOrder.dart';
import 'package:api_work2/screens/profile.dart';
import 'package:api_work2/screens/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'items.dart';
import 'more.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
        appBar:  AppBar(
          toolbarHeight: 280,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: Customshape(),
            child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF58AAFB),Color(0xFF3E89FB),Color(0xFF1758FB)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("images/logo.png",width: 60,height: 60,),
                    SizedBox(width: 115,),
                    Icon(Icons.add_alert_rounded,color: Colors.white,),
                      SizedBox(width: 20,),
                    ],),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // لون الظل
                              blurRadius: 7,
                              offset: Offset(0, 2),
                              spreadRadius: 0)
                        ],
                    ),
                    height: 100,width: double.infinity,margin: EdgeInsets.only(right: 40,left: 40),
                  ),
                ],
                )
            ),
          ),
        ),

        body: ListView(children: [
        Center(child: Text("Select Service",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xFF0E4DFB)),)),
        SizedBox(height: 50,),
        FutureBuilder<AllWork>(
          future: ApiController().getAllWork(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done && snapshot.data?.data != null
                && snapshot.data!.data!.isNotEmpty) {
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(right: 20,left: 20),
                shrinkWrap: true,
                itemCount: snapshot.data!.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      // String work_id = works[index].id ;
                      int work_id=snapshot.data!.data![index].id!;
                      print(work_id);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>UploadImage(work_id)));
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xFFDE1487),width: 1,style: BorderStyle.solid),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // لون الظل
                            spreadRadius: 1, // قوة الانتشار
                            blurRadius: 5, // قوة التموج
                            offset: Offset(1, 1), // التحويلة (x, y)
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/img2.png",width:40,height: 40,),
                          Text("${snapshot.data!.data![index].name!}",style: TextStyle(fontSize: 13,color: Color(0xFF0E4DFB)),)
                        ],),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("no data found"),
              );
            }
        },)
      ],)
    );
  }

}


class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height-50);
    path.quadraticBezierTo(width/2, height, width, height-50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
