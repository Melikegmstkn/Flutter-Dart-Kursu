class Gonderi {
  int userId;
  int id;
  String title;
  String body;

  Gonderi.fromJson(Map<String, dynamic> map)
      : userId = map["userId"],
        id = map["id"],
        title = map["title"],
        body = map["body"];
}
