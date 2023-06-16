import 'package:api_work2/screens/items.dart';
import 'package:flutter/material.dart';

class OrderDone extends StatefulWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  State<OrderDone> createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.highlight_remove,color: Colors.black,))),
            ),
            SizedBox(height: 100,),

            Image.asset("images/img_14.png",width: double.infinity,height: 272,),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("ORDER ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                Text(" DONE",style: TextStyle(color:Color(0xFF0E4DFB) ,fontWeight: FontWeight.bold,fontSize: 24),),
                Text("! ",style: TextStyle(color:Color(0xFFAF8344) ,fontWeight: FontWeight.bold,fontSize: 24),),
            ],),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 50,left: 50),
              child: Text("The ORDER has been sent. A technician will contact you",style: TextStyle(fontSize: 14,),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 25),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ItemsDetailsPage()));
              },
              child: Container(
                width: 255,
                height: 55,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent.shade400, Colors.lightBlue],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(7)
                ),
                child: Center(
                  child: Text(
                    "GO TO HOME",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],),
      )
    );
  }
}
