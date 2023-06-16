
class dataOrder {
  int? id;
  int? userId;
  int? deliveryId;
  int? workId;
  String? details;
  String? detailsAddress;
  String? lat;
  String? long;
  String? phone;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<PhotoOrder>? photoOrder;
  Work? work;
  String? name;

  dataOrder(
      {this.id,
        this.userId,
        this.deliveryId,
        this.workId,
        this.details,
        this.detailsAddress,
        this.lat,
        this.long,
        this.phone,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.photoOrder,
        this.work});

  dataOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deliveryId = json['delivery_id'];
    workId = json['work_id'];
    details = json['details'];
    detailsAddress = json['details_address'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['photo_order'] != null) {
      photoOrder = <PhotoOrder>[];
      json['photo_order'].forEach((v) {
        photoOrder!.add(new PhotoOrder.fromJson(v));
      });
    }
    work = json['work'] != null ? new Work.fromJson(json['work']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataOrder = new Map<String, dynamic>();
    dataOrder['id'] = this.id;
    dataOrder['user_id'] = this.userId;
    dataOrder['delivery_id'] = this.deliveryId;
    dataOrder['work_id'] = this.workId;
    dataOrder['details'] = this.details;
    dataOrder['details_address'] = this.detailsAddress;
    dataOrder['lat'] = this.lat;
    dataOrder['long'] = this.long;
    dataOrder['phone'] = this.phone;
    dataOrder['status'] = this.status;
    dataOrder['created_at'] = this.createdAt;
    dataOrder['updated_at'] = this.updatedAt;
    if (this.photoOrder != null) {
      dataOrder['photo_order'] = this.photoOrder!.map((v) => v.toJson()).toList();
    }
    if (this.work != null) {
      dataOrder['work'] = this.work!.toJson();
    }
    return dataOrder;
  }


  Map<String, dynamic> toJsonOrder() {
    final Map<String, dynamic> dataOrder = new Map<String, dynamic>();
    dataOrder['details'] = this.details;
    dataOrder['details_address'] = this.detailsAddress;
    // dataOrder['lat'] = this.lat;
    // dataOrder['long'] = this.long;
    dataOrder['phone'] = this.phone;
    // if (this.photoOrder != null) {
    //   dataOrder['photo_order'] = this.photoOrder!.map((v) => v.toJson()).toList();
    // }
    // if (this.work != null) {
    //   dataOrder['work'] = this.work!.toJson();
    // }
    dataOrder['name'] = this.name;

    return dataOrder;
  }


}

class PhotoOrder {
  int? id;
  String? photo;
  int? orderId;
  String? createdAt;
  String? updatedAt;

  PhotoOrder(
      {this.id, this.photo, this.orderId, this.createdAt, this.updatedAt});

  PhotoOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataOrder = new Map<String, dynamic>();
    dataOrder['id'] = this.id;
    dataOrder['photo'] = this.photo;
    dataOrder['order_id'] = this.orderId;
    dataOrder['created_at'] = this.createdAt;
    dataOrder['updated_at'] = this.updatedAt;
    return dataOrder;
  }
}

class Work {
  String? name;
  int? id;

  Work({this.name, this.id});

  Work.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataOrder = new Map<String, dynamic>();
    dataOrder['name'] = this.name;
    dataOrder['id'] = this.id;
    return dataOrder;
  }
}