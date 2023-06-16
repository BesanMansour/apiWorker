
import 'Data2.dart';


class ApiResponce {
  int? code;
  bool? success;
  String? message;
  Data2? data;

  ApiResponce({this.code, this.success, this.message, this.data});

  ApiResponce.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data2.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
