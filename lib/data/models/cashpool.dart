class Cashpool {

  Cashpool(
    this.id,
    this.updatedAt,
    this.createdAt,
    this.title,
    this.description,
    this.ownerId,
    this.isOpened,
  );

  Cashpool.fromJson(Map<String, dynamic> json)
    : id = json["id"] as int,
      updatedAt = DateTime.parse(json["updated_at"] as String),
      createdAt = DateTime.parse(json["created_at"] as String),
      title = json["title"] as String,
      description = json["description"] as String,
      ownerId = json["owner_id"] as int,
      isOpened = json["is_opened"] as bool;
  final int id;
  final DateTime updatedAt;
  final DateTime createdAt;

  final String title;
  final String description;
  final int ownerId;

  final bool isOpened;

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "title": title,
    "description": description,
    "owner_id": ownerId,
    "is_opened": isOpened,
  };
}
