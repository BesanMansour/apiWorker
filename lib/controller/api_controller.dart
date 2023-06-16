import 'dart:convert';
import 'dart:io';

import 'package:api_work2/controller/AllWork.dart';
import 'package:api_work2/controller/api_url.dart';
import 'package:api_work2/model/dataOrder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/ApiResponce.dart';
import '../model/Data2.dart';
import 'api_mixin.dart';

import 'createOrder.dart';


class ApiController with api_mixin {

  Future<ApiResponce> login({email, password}) async {
    Uri url = Uri.parse('https://studentucas.awamr.com/api/auth/login/user');
    var map = {"email": email, "password": password};

    http.Response response = await http.post(
      url,
      body: map,
      // headers: {HttpHeaders.contentTypeHeader: 'application/json'}
    );
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponce rrespose = ApiResponce.fromJson(jsonResponse);
      print(rrespose.data);
      print(jsonResponse);
      if (response.statusCode == 200) {
        if (rrespose.data != null) {
          GetStorage().write("token", rrespose.data!.token);
          GetStorage().write("email", rrespose.data!.email);
          GetStorage().write("name", rrespose.data!.name);

          print(GetStorage().read("token"));
          print(GetStorage().read("email"));
          print(GetStorage().read("name"));
        }
      }
      return rrespose;
    }
    return faildResponse;
  }

  Future<ApiResponce> Rigester({required Data2 data}) async {
    Uri url = Uri.parse('https://studentucas.awamr.com/api/auth/register/user');

    http.Response response = await http.post(
      url,
      body: data.toJsonRegister(),
      // headers: {HttpHeaders.contentTypeHeader: 'application/json'}
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponce rrespose = ApiResponce.fromJson(jsonResponse);
      return rrespose;
    }
    return faildResponse;
  }

  Future<AllWork> getAllWork() async {

    final url = 'https://studentucas.awamr.com/api/all/works';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final apiResponse = AllWork.fromJson(jsonData);
      return apiResponse;
    } else {
      throw Exception('حدث خطأ أثناء استرداد البيانات');
    }
  }

  Future post_data(String user_token, Map data, File file, String namerequest) async {

    var uri = Uri.parse('https://studentucas.awamr.com/api/create/order');

    var request = await http.MultipartRequest('POST', uri);
    // add header
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_token',
    });
    // add body data without file
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    if (file != null) {
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: (file.path));
      request.files.add(multipartFile);
    }

    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return responsebody;
    } else {
      return response;
    }
  }

  // Future<createOrder> create_order({required dataOrder data}) async {
  //   Uri url = Uri.parse('https://studentucas.awamr.com/api/create/order');
  //
  //   http.Response response = await http.post(
  //     url,
  //     body: data.toJsonOrder(),
  //     // headers: {HttpHeaders.contentTypeHeader: 'application/json'}
  //       headers: {"Authorization": "Bearer "+"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Nzc2N2JmYS1mZWVhLTQ0MTEtOWE0My0wYTliNzE4Y2YwZmEiLCJqdGkiOiIyNzYwNWFkN2I3MDhmMDhiODgwYWQwNDBhNGIwNDk5Mzk3ZmZhMWFmYTljMzlkYTBjYjJhZjczMjE3ZDhjMDE3MDBlY2VmNDZkMzFmMWUxMiIsImlhdCI6MTY4NTA4OTA3MiwibmJmIjoxNjg1MDg5MDcyLCJleHAiOjE3MTY3MTE0NzIsInN1YiI6IjM2MiIsInNjb3BlcyI6W119.C-sJZ6R-FNOQsslVIVlnD8QQ4TGhVIoIjek23LFyaPeJ3UXF-54GemYvAVG-9jjY5GSmd2LrxQkSEGw20WP1Y3jSAwSliNNbVO0H7ta71nyhBVWjLYDCUt9UKxSI_AAon5qHXCP0QYn4n4GxbMbcJNT64L0BgcOeYl46v1Ck9HQOsSq95w9klAj7gK90PEpxpHFHXs-gacadhxiNtfqexm6b-P0mk_qg-Bol7vY1yH5VBZE_FXlpxI-mtL-7xPDU2CGF9pwC2bW6AY3nljqc4jnf0PX5PUfq5YVZhk3zlvAyDrWDgMcCPA1hmSbqAHhD9zwaf9PxCr00tIvJS_LgSL-Oy2NB5fEFCQJrCAUymmuv_ZoprpEl0xKISHE4PtooHxB6yc3jDXnvNLp1MdEpsoq_D2JBtaN4LAm-aTfp_h2ThFC75flRr5uLrL0EwWzbXanSO84X0loH01jfr3Ms_sUQM4_hc17nZhodzz_45Lcc4ZLukOLbg75iSWJ5twIvwJwHBe2e_mXp_TpZgE_zMNjKTdvi9OsQNv_qAs7QjimZJxVL01SmPDkPfC8Kp74HGt_tlLE7SKxwN5i-bxyxkBOFifNQKt_IEP7OpOQJu6rjGbNTmGpuNAJ1K2OnXZt_cBvEPf8BT_UmRxjhGfDyEa1PD9T7oOWZmEA-xWcr-F4"}
  //   );
  //
  //   print(GetStorage().read("token"));
  //   print(response.statusCode);
  //   print(response.body);
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var jsonResponse = jsonDecode(response.body);
  //     createOrder rrespose = createOrder.fromJson(jsonResponse);
  //     print("****************************************");
  //     print(response.statusCode);
  //     print(rrespose.data);
  //     print("****************************************");
  //     return rrespose;
  //   }
  //   else {
  //     throw Exception('حدث خطأ أثناء استرداد البيانات');
  //   }
  //
  // }



  // Future<createOrder> create_order(data) async {
  //   Uri url = Uri.parse('https://studentucas.awamr.com/api/create/order');
  //
  //   http.Response response = await http.post(
  //     url,
  //     body: {
  //       "work_id":"1",
  //       "details":"hala madrid",
  //       "details_address":"hala madrid",
  //       "phone":"0594042996",
  //       "lat":"234.1",
  //       "long":"23423.2",
  //     },
  //     // headers: {HttpHeaders.contentTypeHeader: 'application/json'}
  //     //   headers: {"Authorization": "Bearer "+GetStorage().read("token")}
  //   );
  //
  //   print(response.statusCode );
  //
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var jsonResponse = jsonDecode(response.body);
  //     createOrder rrespose = createOrder.fromJson(jsonResponse);
  //     print("****************************************");
  //     print(response.statusCode);
  //     print(rrespose.data);
  //     print("****************************************");
  //     return rrespose;
  //   }
  //   else {
  //     throw Exception('حدث خطأ أثناء استرداد البيانات');
  //   }
  // }

}