
import 'package:api_work2/controller/api_controller.dart';
import 'package:api_work2/model/Item.dart';
import 'package:flutter/cupertino.dart';


class PorviderClass extends ChangeNotifier {
  List<Item> list = [];

  getData() async {
    // api تبع الليست
   // list = await ApiController().getAllData();
   notifyListeners();
  }

  updateList(Item c){
    list.add(c);
    notifyListeners();
  }
}