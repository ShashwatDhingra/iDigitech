import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductsModel {
  int statusCode;
  bool status;
  String error;
  String message;
  List<ProductData> data;
  ProductsModel({
    required this.statusCode,
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'status': status,
      'error': error,
      'message': message,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      statusCode: map['statusCode'] as int,
      status: map['status'] as bool,
      error: map['error'] ,
      message: map['message'] ,
      data: List<ProductData>.from((map['data']).map<ProductData>((x) => ProductData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductData {
  String id;
  String? name;
  String? description;
  String? colour;
  String? fabric;
  List<ProductImage>? image;
  String? category;
  String? categoryType;
  String? productTypes;
  List<String> size;
  String? availableStock;
  int? price;
  String? style;
  String? careInstruction;
  String? fitType;
  String? MRP;
  String? createdBy;
  String? createdAt;
  String? modifiedBy;
  String? modifiedAt;
  String? discount;
  bool? approve;
  String? menuType;
  bool? isSundaySale;
  int? sundaySalePrice;
  String? collection;
  ProductData({
    required this.id,
    required this.name,
    required this.description,
    required this.colour,
    required this.fabric,
    required this.image,
    required this.category,
    required this.categoryType,
    required this.productTypes,
    required this.size,
    required this.availableStock,
    required this.price,
    required this.style,
    required this.careInstruction,
    required this.fitType,
    required this.MRP,
    required this.createdBy,
    required this.createdAt,
    required this.modifiedBy,
    required this.modifiedAt,
    required this.discount,
    required this.approve,
    required this.menuType,
    required this.isSundaySale,
    required this.sundaySalePrice,
    required this.collection,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'colour': colour,
      'fabric': fabric,
      'image': image != null ? image!.map((x) => x.toMap()).toList() : [],
      'category': category,
      'categoryType': categoryType,
      'productTypes': productTypes,
      'size': size,
      'availableStock': availableStock,
      'price': price,
      'style': style,
      'careInstruction': careInstruction,
      'fitType': fitType,
      'MRP': MRP,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'modifiedBy': modifiedBy,
      'modifiedAt': modifiedAt,
      'discount': discount,
      'approve': approve,
      'menuType': menuType,
      'isSundaySale': isSundaySale,
      'sundaySalePrice': sundaySalePrice,
      'collection': collection,
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      id: map['id'] ,
      name: map['name'] ,
      description: map['description'] ,
      colour: map['colour'] ,
      fabric: map['fabric'] ,
      image: List<ProductImage>.from((map['image']).map<ProductImage>((x) => ProductImage.fromMap(x as Map<String,dynamic>),),),
      category: map['category'] ,
      categoryType: map['categoryType'] ,
      productTypes: map['productTypes'] ,
      size: List<String>.from((map['size'])),
      availableStock: map['availableStock'] ,
      price: map['price'] as int,
      style: map['style'] ,
      careInstruction: map['careInstruction'] ,
      fitType: map['fitType'] ,
      MRP: map['MRP'] ,
      createdBy: map['createdBy'] ,
      createdAt: map['createdAt'] ,
      modifiedBy: map['modifiedBy'] ,
      modifiedAt: map['modifiedAt'] ,
      discount: map['discount'] ,
      approve: map['approve'] as bool,
      menuType: map['menuType'] ,
      isSundaySale: map['isSundaySale'] as bool,
      sundaySalePrice: map['sundaySalePrice'],
      collection: map['collection'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductData.fromJson(String source) => ProductData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductImage {
  String? path;
  ProductImage({
    required this.path,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
    };
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return ProductImage(
      path: map['path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductImage.fromJson(String source) => ProductImage.fromMap(json.decode(source) as Map<String, dynamic>);
}
