class ProductsModel {
  final Products products;

  ProductsModel({
    required this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    products: Products.fromJson(json["products"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "products": products.toJson(),
  };
}

class Products {
  final String categoryName;
  final String brandName;
  final String type;
  final String brandCover;
  final List<ProductList> productsList;

  Products( {
    required this.categoryName,
    required this.brandName,
    required this.type,
    required this.brandCover,
    required this.productsList,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    categoryName: json["categoryName"]?? "",
    brandName: json["brandName"]??"",
    type: json["type"] ?? "",
    brandCover: json["brandCover"] ?? "",
    productsList: List<ProductList>.from(
        json["productslist"].map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
    "brandName": brandName,
    "brandCover": brandCover,
    "productslist":
    List<dynamic>.from(productsList.map((x) => x.toJson())),
  };
}

class ProductList {
  final int productId;
  final String productName;
  final String productImage;

  ProductList({
    required this.productId,
    required this.productName,
    required this.productImage,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    productId: json["product_Id"] ?? 0,
  productName: json["productName"]?? "",
    productImage: json["productImage"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "product_Id": productId,
    "productName": productName,
    "productImage": productImage,
  };
}