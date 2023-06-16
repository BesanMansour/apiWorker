import 'package:api_work2/screens/register.dart';
import 'package:flutter/material.dart';

import '../controller/api_controller.dart';
import '../model/ApiResponce.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  bool b = false;
  String selectedValue = '+966';

  late TabController _tabController;
  int select_tab = 1;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
            child: Container(
              padding: EdgeInsets.only(
                top: 55,
              ),
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent.shade400, Colors.lightBlue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Image.asset(
                "images/logo.png",
                width: 300,
                height: 300,
              ),
            ),
          ),
          Positioned(
            top: 250,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                padding:
                    EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      DefaultTabController(
                          initialIndex: select_tab,
                          length: 2,
                          child: TabBar(
                            onTap: (index) {
                              setState(() {
                                select_tab = index;
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
                      //Email

                      select_tab == 1
                          ? Column(
                              children: [
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
                                    ),                                    ),
                                  textDirection: TextDirection.ltr,
                                  keyboardType: TextInputType.emailAddress,
                                ),

                                SizedBox(
                                  height: 30,
                                ),
                                //Phone
                                Container(
                                  padding: EdgeInsets.all(0.8),
                                  height: 55,
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
                                                value!; // حفظ القيمة المحددة في المتغير
                                          });
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: '5000 |',
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
                                SizedBox(
                                  height: 30,
                                ),
                                //Password
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _passwordTextController,
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
                                        SizedBox(width: 8),
                                        Text(
                                          'Remember me?',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                          "New Member?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return RegisterPage();
                                            }));
                                          },
                                          child: Text(
                                            "SIGN UP",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0E4DFB),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => HomePage()),
                                        // );
                                        _performLogin();
                                      },
                                      child: Container(
                                        width: 164,
                                        height: 55,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.blueAccent.shade400,
                                                Colors.lightBlue
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Center(
                                          child: Text(
                                            "LOGIN",
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
                                SizedBox(
                                  height: 100,
                                ),
                                Text("Get Start Now ->",style: TextStyle(color: Color(0xFF272727,),fontWeight: FontWeight.bold,fontSize: 16),)
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

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _passwordTextController.text.length >= 6 &&
        _passwordTextController.text.length <= 30) {
      return true;
    }
    return false;
  }

  Future<void> _login() async {
    ApiResponce rrespose = await ApiController().login(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    print(rrespose.success);
    print(rrespose.data);
    if (rrespose.success!) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
