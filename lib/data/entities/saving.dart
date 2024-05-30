class Saving {
  final int id;
  final int price;
  final int targetId;

  Saving({
    this.id = 0,
    required this.price,
    this.targetId = 0
  });

  Map<String, dynamic> toDbJson() {
    return {
      "price": price,
      "target_id": targetId
    };
  }

  factory Saving.fromDbJson(Map<String, dynamic> json) {
    return Saving(
      id: json["id"],
      price: json["price"],
      targetId: json["target_id"]
    );
  }
}