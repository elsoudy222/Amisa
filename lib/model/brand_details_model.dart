class BrandDetailsModel {
  final List<BrandDetail> brandDetails;

  BrandDetailsModel({
    required this.brandDetails,
  });

  factory BrandDetailsModel.fromJson(Map<String, dynamic> json) => BrandDetailsModel(
    brandDetails: List<BrandDetail>.from(json["brandDetails"].map((x) => BrandDetail.fromJson(x) ?? [])).toList(),
  );

  Map<String, dynamic> toJson() => {
    "brandDetails": List<dynamic>.from(brandDetails.map((x) => x.toJson())),
  };
}

class BrandDetail {
  final int id;
  final int catId;
  final String brandName;
  final String description;
  final String brandPhoto;
  final String coverImage;

  BrandDetail({
    required this.id,
    required this.catId,
    required this.brandName,
    required this.description,
    required this.brandPhoto,
    required this.coverImage,
  });

  factory BrandDetail.fromJson(Map<String, dynamic> json) => BrandDetail(
    id: json["id"] ?? 0,
    catId: json["cat_Id"]??"",
    brandName: json["brandName"]??"",
    description: json["description"]??"",
    brandPhoto: json["brandPhoto"]??"",
    coverImage: json["coverImage"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cat_Id": catId,
    "brandName": brandName,
    "description": description,
    "brandPhoto": brandPhoto,
    "coverImage": coverImage,
  };
}
