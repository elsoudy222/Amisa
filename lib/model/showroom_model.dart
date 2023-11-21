class ShowRoomsModel {
  final List<Room> rooms;

  ShowRoomsModel({
    required this.rooms,
  });

  factory ShowRoomsModel.fromJson(Map<String, dynamic> json) => ShowRoomsModel(
    rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
  };
}

class Room {
  final int id;
  final String title;
  final String categories;
  final String pobox;
  final String tel;
  final String fax;
  final String opentime;
  final String fridaytime;
  final String email;
  final String image;
  final String location;
  final String link;
  final String video;

  Room({
    required this.id,
    required this.title,
    required this.categories,
    required this.pobox,
    required this.tel,
    required this.fax,
    required this.opentime,
    required this.fridaytime,
    required this.email,
    required this.image,
    required this.location,
    required this.link,
    required this.video,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    id: json["id"],
    title: json["title"],
    categories: json["categories"],
    pobox: json["pobox"],
    tel: json["tel"],
    fax: json["fax"],
    opentime: json["opentime"],
    fridaytime: json["fridaytime"],
    email: json["email"],
    image: json["image"],
    video: json["video"],
    link: json["link"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "categories": categories,
    "pobox": pobox,
    "tel": tel,
    "fax": fax,
    "opentime": opentime,
    "fridaytime": fridaytime,
    "email": email,
    "image": image,
    "video": video,
    "location": location,
    "link": link,
  };
}
