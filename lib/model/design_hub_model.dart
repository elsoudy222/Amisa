class DesignHubModel {
  final List<DesignHup> designHup;

  DesignHubModel({
    required this.designHup,
  });

  factory DesignHubModel.fromJson(Map<String, dynamic> json) => DesignHubModel(
    designHup: List<DesignHup>.from(json["designhup"].map((x) => DesignHup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "designhup": List<dynamic>.from(designHup.map((x) => x.toJson())),
  };
}

class DesignHup {
  final int designId;
  final String designName;
  final List<String> designPhotos;

  DesignHup({
    required this.designId,
    required this.designName,
    required this.designPhotos,
  });

  factory DesignHup.fromJson(Map<String, dynamic> json) => DesignHup(
    designId: json["design_id"],
    designName: json["designName"],
    designPhotos: List<String>.from(json["designphotos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "design_id": designId,
    "designName": designName,
    "designphotos": List<dynamic>.from(designPhotos.map((x) => x)),
  };
}
