import 'package:flutter/material.dart';

import 'order_done.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String selectedValue = '+966';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(height: 30,),
          Image.asset("images/map.jpeg",width: double.infinity,height: 163,fit: BoxFit.cover,),
          SizedBox(height: 20,),
          TextFormField(
            maxLines: 5, // عدد الأسطر المراد عرضها في الحقل
            decoration: InputDecoration(
              hintText: "More Details About Problem …...",
              hintStyle: TextStyle(
                color: Color(0xFFC2CECE),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0E4DFB), width: 2,style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),
          ),
          SizedBox(height: 20,),
          //Phone
          Container(
            padding: EdgeInsets.all(0.8),
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color:Color(0xFFAF8344),
                )
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    child: Icon(Icons.flag,color: Colors.white,),
                    backgroundColor: Color(0xFF0E4DFB),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedValue,
                  items: ['+966', '+970', '+972'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!; // حفظ القيمة المحددة في المتغير
                    });
                  },
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '5000',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0E4DFB),
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>OrderDone()));
            }, child: Container(
              width: double.infinity,
              height: 55,
              alignment: Alignment.center,
              child: Text("NEXT",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
            ,style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF222328),
          ),)

        ],
        ),
      ),
    );
  }
}
