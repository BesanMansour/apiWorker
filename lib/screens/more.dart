import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF58AAFB),Color(0xFF3E89FB),Color(0xFF1758FB)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              children: [
              Container(
                width: 35,
                height: 35,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: 20,),
              ),
                SizedBox(width: 115,),
                Text("More",style: TextStyle(color: Colors.white,fontSize: 20),)
            ],
            )
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE),),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Text(
                    "FAQ's",
                    style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Text(
                    "About App",
                    style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Text(
                    "Terms & Conditions",
                    style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Text(
                    "Rate App",
                    style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

              ],
            ),
          ],
        ),
      )
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