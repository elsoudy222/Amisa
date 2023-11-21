class TimelineModel {
  final List<Timeline> timeline;

  TimelineModel({
    required this.timeline,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) => TimelineModel(
    timeline: List<Timeline>.from(json["timeline"].map((x) => Timeline.fromJson(x))),
  );


}

class Timeline {
  final int id;
  final String date;
  final String description;
  final String image;

  Timeline({
    required this.id,
    required this.date,
    required this.description,
    required this.image,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
    id: json["id"],
    date: json["date"],
    description: json["description"],
    image: json["image"],
  );

}
