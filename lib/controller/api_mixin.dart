import 'package:api_work2/controller/createOrder.dart';

import '../model/ApiResponce.dart';


mixin api_mixin {
  ApiResponce faildResponse = ApiResponce(success: false,message: "someThing Wrong");
  createOrder faildOrder = createOrder(success: false,message: "someThing Wrong") ;
}