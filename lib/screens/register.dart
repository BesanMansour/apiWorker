
import 'package:api_work2/screens/login.dart';
import 'package:flutter/material.dart';

import '../controller/api_controller.dart';
import '../model/ApiResponce.dart';
import '../model/Data2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _phoneTextController;

  bool b = false;
  String selectedValue = '+966';
  String selectedService = 'Select service';
  late TabController _tabController;
  int select_tab = 1;
  var selectService;
  List<String> services = ['Carpenter', 'Builder', 'Smith'];


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _phoneTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent.shade400, Colors.lightBlue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                padding:
                EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DefaultTabController(
                          initialIndex: select_tab,
                          length: 2,
                          child: TabBar(
                            onTap: (index) {
                              setState(() {
                                select_tab = index;
                                print(select_tab);
                              });
                            },
                            controller: _tabController,
                            indicatorColor: Color(0xFF0E4DFB),
                            labelColor: Color(0xFF0E4DFB),
                            unselectedLabelColor: Color(0xFF6D7278),
                            padding: EdgeInsets.only(bottom: 30),
                            tabs: [
                              Tab(
                                child: Text(
                                  'Service Provider',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Customer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      select_tab == 1
                          ? Column(
                        children: [
                          //Full Name
                          TextFormField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              hintStyle: TextStyle(
                                  color: Color(0xFFC2CECE),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              hintTextDirection: TextDirection.ltr,
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
                            ),
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Email
                          TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color(0xFFC2CECE),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              hintTextDirection: TextDirection.ltr,
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

                            ),
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Phone
                          Container(
                            padding: EdgeInsets.all(0.8),
                            height: 57,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(7)),
                                border: Border.all(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Colors.blue,
                                )),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.flag,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xFF0E4DFB),
                                  ),
                                ),
                                SizedBox(width: 10),
                                DropdownButton<String>(
                                  value: selectedValue,
                                  items: ['+966', '+970', '+972']
                                      .map((String value) {
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
                                      selectedValue =
                                      value!;
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
                          SizedBox(
                            height: 30,
                          ),
                          //Password
                          TextFormField(
                            controller: _passwordTextController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "********",
                              hintStyle: TextStyle(
                                  color: Color(0xFFC2CECE),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              hintTextDirection: TextDirection.ltr,
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
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Color(0xFFC2CECE),
                              ),
                            ),
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          DropdownButtonFormField<String>(
                            value: selectService,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.blue),
                              hintText: 'Select service',
                              hintStyle: TextStyle(
                                color: Color(0xFFC2CECE),
                                fontSize: 15,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            items: services.map((String service) {
                              return DropdownMenuItem(
                                value: service,
                                child: Text(service),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedService = value!;
                              });
                            },
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: b,
                                      onChanged: (value) {
                                        setState(() {
                                          b = value!;
                                        });
                                      }),
                                  SizedBox(width: 2),
                                  Text(
                                    'I Read and Accept',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " Home Service Terms & Conditions",
                                    style: TextStyle(
                                        color: Color(0xFF0E4DFB),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Have Account?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                      decoration:
                                      TextDecoration.underline,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0E4DFB),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 164,
                                height: 55,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blueAccent.shade700,
                                        Colors.lightBlue
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(7)),
                                child: InkWell(
                                  onTap: () {
                                    _performRegister();
                                    // Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                          : Container(
                        height: 500,
                        width: double.infinity,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty) {
      return true;
    }

    // showSnackBar(context:context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    ApiResponce rrespose = await ApiController().Rigester(data: data);
    if (rrespose.success!) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Data2 get data {
    Data2 data = Data2();
    data.name = _nameTextController.text;
    data.email = _emailTextController.text;
    data.password = _passwordTextController.text;
    data.phone = _phoneTextController.text;
    return data;
  }
}
