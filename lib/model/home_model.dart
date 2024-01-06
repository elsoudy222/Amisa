class HomeModel {
  List<NewArrival> newArrival;
  List<Ads> ads;
  List<Category> categories;
  List<News> news;

  HomeModel({
    required this.newArrival,
    required this.categories,
    required this.news,
    required this.ads,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    newArrival: List<NewArrival>.from(json["NewArrival"].map((x) => NewArrival.fromJson(x)) ??[]).toList(),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))?? []).toList(),
    news: List<News>.from(json["news"].map((x) => News.fromJson(x))??[]).toList(),
    ads: List<Ads>.from(json["ads"].map((x) => Ads.fromJson(x))??[]).toList(),
  );

  Map<String, dynamic> toJson() => {
    "NewArrival": List<dynamic>.from(newArrival.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "news": List<dynamic>.from(news.map((x) => x)),
  };
}

class Category {
  int id;
  String catName;
  String description;
  String image;

  Category({
    required this.id,
    required this.catName,
    required this.description,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] ?? "",
    catName: json["catName"]??"",
    description: json["description"]??"",
    image: json["image"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "catName": catName,
    "description": description,
    "image": image,
  };
}

class Ads {
  int id;
  String photo;

  Ads({
    required this.id,
    required this.photo,
  });

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
    id: json["id"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo": photo,
  };
}

class NewArrival {
  int id;
  String brandName;
  String productName;
  String photo;

  NewArrival({
    required this.id,
    required this.brandName,
    required this.productName,
    required this.photo,
  });

  factory NewArrival.fromJson(Map<String, dynamic> json) => NewArrival(
    id: json["id"]?? 0,
    brandName: json["brandName"] ??"",
    productName: json["productName"]??"",
    photo: json["photo"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brandName": brandName,
    "productName": productName,
    "photo": photo,
  };
}

class News {
  News({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String image;

  News.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['image'] = image;
    return _data;
  }
}
