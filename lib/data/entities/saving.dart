class Saving {
  final int id;
  final String createAt;
  final double price;
  final int targetId;

  Saving({
    this.id = 0,
    required this.createAt,
    required this.price,
    this.targetId = 0
  });

  Map<String, dynamic> toDbJson() {
    return {
      "create_at": createAt,
      "price": price,
      "target_id": targetId
    };
  }

  factory Saving.fromDbJson(Map<String, dynamic> json) {
    return Saving(
      id: json["id"],
      createAt: json["created_at"],
      price: json["price"],
      targetId: json["target_id"]
    );
  }
}