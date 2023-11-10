// class ProductsModel {
//   ProductsModel({required this.products, required this.numberofpages,});
//   late final Products products;
//   late final int numberofpages;
//
//
//   ProductsModel.fromJson(Map<String, dynamic> json){
//     products = Products.fromJson(json['products']);
//     numberofpages = json['numberofpages'];
//   }
// }
//
// class Products {
//   Products({required this.categoryName, required this.brandName, required this.type, required this.brandCover, required this.productslist,});
//   late final String categoryName;
//   late final String brandName;
//   late final String type;
//   late final String brandCover;
//   late final List<Productslist> productslist;
//   Products.fromJson(Map<String, dynamic> json){
//     categoryName = json['categoryName'] ?? "";
//     brandName = json['brandName']?? "";
//     type = json['type']??"";
//     brandCover = json['brandCover']??"";
//     productslist = List.from(json['productslist']).map((e)=>Productslist.fromJson(e)).toList();
//   }
// }
//
// class Productslist {
//   Productslist({
//     required this.productId,
//     required this.productName,
//     required this.productImage,
//   });
//   late final int productId;
//   late final String productName;
//   late final String productImage;
//
//   Productslist.fromJson(Map<String, dynamic> json){
//     productId = json['product_Id']?? "";
//     productName = json['productName'] ?? "";
//     productImage = json['productImage'] ?? "";
//   }
//
//
// }

class ProductsModel {
  final Products products;
  final int numberofpages;

  ProductsModel({
    required this.products,
    required this.numberofpages,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    products: Products.fromJson(json["products"] ?? {}),
    numberofpages: json["numberofpages"] ?? 1,

      );

  Map<String, dynamic> toJson() => {
        "products": products.toJson(),
        "numberofpages": numberofpages,
      };
}

class Products {
  final String categoryName;
  final String brandName;
  final String type;
  final String brandCover;
  final List<ProductsList> productsList;

  Products({
    required this.categoryName,
    required this.brandName,
    required this.type,
    required this.brandCover,
    required this.productsList,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        categoryName: json["categoryName"] ?? "",
        brandName: json["brandName"] ?? "",
        type: json["type"] ?? "",
        brandCover: json["brandCover"] ?? "",
    productsList: (json["productslist"] as List<dynamic>?)
        ?.map((x) => ProductsList.fromJson(x))
        .toList() ?? [],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "brandName": brandName,
        "type": type,
        "brandCover": brandCover,
        "productslist": List<dynamic>.from(productsList.map((x) => x.toJson())).toList(),
      };
}

class ProductsList {
  final int productId;
  final String productName;
  final String productImage;

  ProductsList({
    required this.productId,
    required this.productName,
    required this.productImage,
  });

  factory ProductsList.fromJson(Map<String, dynamic> json) => ProductsList(
    productId: json["product_Id"] ?? 0,
    productName: json["productName"] ?? "",
    productImage: json["productImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "product_Id": productId,
        "productName": productName,
        "productImage": productImage,
      };
}
