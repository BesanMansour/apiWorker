import '../model/dataOrder.dart';

class createOrder {
  int? code;
  bool? success;
  String? message;
  List<dataOrder>? data;

  createOrder({this.code, this.success, this.message, this.data});

  createOrder.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <dataOrder>[];
      json['data'].forEach((v) {
        data!.add(new dataOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

