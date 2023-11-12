

class CollectionModel {
  final Collections collections;

  CollectionModel({
    required this.collections,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) => CollectionModel(
    collections: Collections.fromJson(json["collections"]),
  );

  Map<String, dynamic> toJson() => {
    "collections": collections.toJson(),
  };
}

class Collections {
  final int collectionsId;
  final String collectionName;
  final List<String> collectionsimages;

  Collections({
    required this.collectionsId,
    required this.collectionName,
    required this.collectionsimages,
  });

  factory Collections.fromJson(Map<String, dynamic> json) => Collections(
    collectionsId: json["collections_id"]??0,
    collectionName: json["collectionName"]??"",
    collectionsimages: List<String>.from(json["collectionsimages"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "collections_id": collectionsId,
    "collectionName": collectionName,
    "collectionsimages": List<dynamic>.from(collectionsimages.map((x) => x)),
  };
}
