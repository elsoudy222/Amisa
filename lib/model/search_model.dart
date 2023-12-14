

// class SearchModel {
//   final List<Result> result;
//
//   SearchModel({
//     required this.result,
//   });
//
//   factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
//     result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))??[]).toList(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result.map((x) => x.toJson())),
//   };
// }
//
// class Result {
//   final int id;
//   final int brandId;
//   final String productName;
//   final String description;
//   final String coverImages;
//   final String type;
//   final int isNewArrival;
//
//   Result({
//     required this.id,
//     required this.brandId,
//     required this.productName,
//     required this.description,
//     required this.coverImages,
//     required this.type,
//     required this.isNewArrival,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["id"],
//     brandId: json["brand_id"],
//     productName: json["productName"],
//     description: json["description"],
//     coverImages: json["coverImages"],
//     type: json["type"],
//     isNewArrival: json["isNewArrival"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "brand_id": brandId,
//     "productName": productName,
//     "description": description,
//     "coverImages": coverImages,
//     "type": type,
//     "isNewArrival": isNewArrival,
//   };
// }

class SearchModel {
  List<Result> result;

  SearchModel({required this.result});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      result: (json['result'] as List)
          .map((item) => Result.fromJson(item))
          .toList(),
    );
  }
}

class Result{
  int id;
  int brandId;
  String productName;
  List<String> coverImages;

  Result({required this.id, required this.brandId, required this.productName, required this.coverImages});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      brandId: json['brand_id'],
      productName: json['productName'],
      coverImages: List<String>.from(json['coverImages']),
    );
  }
}