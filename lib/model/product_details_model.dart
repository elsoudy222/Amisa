class ProductsDetailsModel {
  final Product product;
  final List<Collection> collections;
  final List<Info> info;
  final List<Info> matrialinfo;

  ProductsDetailsModel({
    required this.product,
    required this.collections,
    required this.info,
    required this.matrialinfo,
  });

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) => ProductsDetailsModel(
    product: Product.fromJson(json["product"]),
    collections: List<Collection>.from(json["collections"].map((x) => Collection.fromJson(x))),
    info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
    matrialinfo: List<Info>.from(json["matrialinfo"].map((x) => Info.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
    "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
    "matrialinfo": List<dynamic>.from(matrialinfo.map((x) => x.toJson())),
  };
}

class Collection {
  final int collectionsId;
  final String collectionName;
  final String collectionphoto;

  Collection({
    required this.collectionsId,
    required this.collectionName,
    required this.collectionphoto,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    collectionsId: json["collections_id"],
    collectionName: json["collectionName"],
    collectionphoto: json["collectionphoto"],
  );

  Map<String, dynamic> toJson() => {
    "collections_id": collectionsId,
    "collectionName": collectionName,
    "collectionphoto": collectionphoto,
  };
}

class Info {
  final int id;
  final String infoTitle;
  final String? infoValue;
  final int productId;
  final String? matrPhoto;

  Info({
    required this.id,
    required this.infoTitle,
    this.infoValue,
    required this.productId,
    this.matrPhoto,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["id"],
    infoTitle: json["infoTitle"],
    infoValue: json["infoValue"],
    productId: json["product_id"],
    matrPhoto: json["matrPhoto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "infoTitle": infoTitle,
    "infoValue": infoValue,
    "product_id": productId,
    "matrPhoto": matrPhoto,
  };
}

class Product {
  final int productId;
  final String productName;
  final List<String> coverImages;
  final String type;

  Product({
    required this.productId,
    required this.productName,
    required this.coverImages,
    required this.type,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productName: json["productName"],
    coverImages: List<String>.from(json["coverImages"].map((x) => x)),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "productName": productName,
    "coverImages": List<dynamic>.from(coverImages.map((x) => x)),
    "type": type,
  };
}
