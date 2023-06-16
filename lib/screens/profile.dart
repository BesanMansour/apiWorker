import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2 - 100,
              width: double.infinity,
              color: Colors.red,
              child: LayoutBuilder(builder: (context, constrains) {
                return Stack(
                  children: [
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        height: constrains.maxHeight / 2,
                        width: constrains.maxWidth,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                          colors: [Color(0xFF62B7FB),Color(0xFF58AAFB),Color(0xFF3E89FB),Color(0xFF1758FB)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: constrains.maxHeight / 2 + 15,
                        width: constrains.maxWidth,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Colors.white,
                        ),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Seraj Al Mutawa',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFF293340),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Riyadh, Saudi Arabia',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF272727),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                              Icon(Icons.edit_calendar_rounded,color: Color(0xFF0E4DFB),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('images/user.png'),
                          ),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              }),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(top: 60,bottom: 20,right: 20,left: 20),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Text(
                          "Language",
                          style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("English",
                          style: TextStyle(
                              fontSize: 14,color: Color(0xFFC2CECE),fontWeight: FontWeight.bold)),
                      Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE),),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Text(
                          "My Rates",
                          style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Text(
                          "Contact us",
                          style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Text(
                          "Share App",
                          style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.navigate_next_outlined,color: Color(0xFFC2CECE)),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.login_outlined,color: Color(0xFFAF8344),size: 25,),
                SizedBox(width: 7,),
                Text("SIGN OUT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xFF0E4DFB)),)
              ],),
            )
          ],
        ),
      ),
    );
  }
}
