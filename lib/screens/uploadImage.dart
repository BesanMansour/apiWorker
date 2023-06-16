import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:api_work2/model/dataOrder.dart';
import 'package:api_work2/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/api_controller.dart';
import '../controller/createOrder.dart';
import 'order_done.dart';
class UploadImage extends StatefulWidget {
  late int work_id;

  UploadImage(this.work_id);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  late TextEditingController _detailsTextController;
  late TextEditingController _detailsAdressTextController;
  late TextEditingController _phoneTextController;

  String selectedValue = '+966';
  final ImagePicker picker = ImagePicker();
  XFile? file;

  @override
  void initState() {
    super.initState();
    _detailsTextController = TextEditingController();
    _detailsAdressTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    int workId = widget.work_id;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF58AAFB),
                    Color(0xFF3E89FB),
                    Color(0xFF1758FB)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 115,
                  ),
                  Text(
                    "Smith",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFF0E4DFB),
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                file == null
                    ? Image.asset(
                        "images/img_8.png",
                        width: 40,
                        height: 40,
                      )
                    : Image.file(
                        File(file!.path),
                        width: 80,
                        height: 80,
                      ),
                SizedBox(
                  width: 65,
                ),
                InkWell(
                  child: Text(
                    "Image Problem",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    file = await picker.pickImage(source: ImageSource.gallery);
                    if (file == null) {
                      print('File Null !!!!');
                    } else {
                      print('file not null');
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Text(
            "image must be no more than 2 MB Max 5 Image",
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF7F8FA6),
            ),
          ),
          SizedBox(height: 60),
          TextFormField(
            controller: _detailsTextController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "More Details About Problem …...",
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(
                color: Color(0xFFC2CECE),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(7)),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            maxLines: 5,
            controller: _detailsAdressTextController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "More Details About Location  …...",
              hintStyle: TextStyle(
                color: Color(0xFFC2CECE),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(7)),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),
          ),
          SizedBox(height: 20),
          // Phone
          Container(
            padding: EdgeInsets.all(0.8),
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                width: 1,
                style: BorderStyle.solid,
                color: Color(0xFFAF8344),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "images/img_10.png",
                    width: 30,
                    height: 30,
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
                      selectedValue = value!;
                    });
                  },
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _phoneTextController,
                    decoration: InputDecoration(
                      hintText: '5000 |',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFAF8344),
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              // _createOrder();
              String token = GetStorage().read('token');
              print(token);
              Map data = {
                'work_id': workId.toString(),
                'details': _detailsTextController.text,
                'details_address': _detailsAdressTextController.text,
                'phone': _phoneTextController.text,
                'lat': '234.1',
                'long': '23423.2',
              };
              if (file != null && token != null) {
                print(data.toString());
                print(file!.path);
                ApiController()
                    .post_data(token, data, File(file!.path), 'photos[]');

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDone()));
              } else {
                print("photo null");
                AwesomeDialog(
                  context: context,
                  animType: AnimType.rightSlide,
                  dialogType: DialogType.info,
                  btnOk: null,
                  body: Center(child: Text(
                    'الرجاء ادخال المشكلة الخاصة بك ',
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),),
                  btnOkOnPress: () {
                  },
                )..show();
              }
            },
            // _createOrder,
            child: Container(
              width: double.infinity,
              height: 55,
              alignment: Alignment.center,
              child: Text(
                "ADD ORDER",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF222328),
            ),
          )
        ],
      ),
    );
  }

// Future<void> _createOrder() async {
//   if (_checkData()) {
//     await _order();
//   }
// }
//
// bool _checkData() {
//   if (_detailsTextController.text.isNotEmpty &&
//       _detailsAdressTextController.text.isNotEmpty &&
//       _phoneTextController.text.isNotEmpty &&
//       _workTextController.text.isNotEmpty) {
//     return true;
//   }
//   // showSnackBar(context:context, message: 'Enter required data!', error: true);
//   return false;
// }
//
// Future<void> _order() async {
//   createOrder response = await ApiController().create_order(data: data);
//   if (response.success! == false) {
//     print("*****************777777777777777777");
//     print(response.success);
//     print(response.data);
//     print(response.message);
//     print(response.code);
//     print("*****************777777777777777777");
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => OrderDone()),
//     );
//   }
// }
//
// dataOrder get data {
//   dataOrder data = dataOrder();
//   data.details = _detailsTextController.text;
//   data.detailsAddress = _detailsAdressTextController.text;
//   data.phone = _phoneTextController.text;
//   data.name = _workTextController.text;
//   return data;
// }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}



