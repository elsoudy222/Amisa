

class CategoryModel {
  Category category;
  CategoryModel({
    required this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "category": category.toJson(),
  };
}

class Category {
  int categoryId;
  String categoryName;
  String categoryDescription;
  String categoryImage;
  List<Brand> brands;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
    required this.categoryImage,
    required this.brands,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_Id"],
    categoryName: json["categoryName"],
    categoryDescription: json["categorydescription"],
    categoryImage: json["categoryImage"],
    brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_Id": categoryId,
    "categoryName": categoryName,
    "categorydescription": categoryDescription,
    "categoryImage": categoryImage,
    "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
  };
}

class Brand {
  int brandId;
  String brandName;
  String brandPhoto;
  String brandCover;

  Brand({
    required this.brandId,
    required this.brandName,
    required this.brandPhoto,
    required this.brandCover,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    brandId: json["brand_id"],
    brandName: json["brandName"],
    brandPhoto: json["brandphoto"],
    brandCover: json["brandCover"],
  );

  Map<String, dynamic> toJson() => {
    "brand_id": brandId,
    "brandName": brandName,
    "brandphoto": brandPhoto,
    "brandCover": brandCover,
  };
}
