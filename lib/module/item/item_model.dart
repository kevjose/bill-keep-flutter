class Item {
  final String name;
  final String description;
  final String boardId;
  final List<String> labels;
  final String itemImageUrl;
  final itemImage;
  final int amount;
  final DateTime itemDate;
  Item({
    this.name,
    this.description,
    this.boardId,
    this.labels,
    this.itemImageUrl,
    this.itemImage,
    this.amount,
    this.itemDate,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        name: json["name"],
        description: json['description'],
        boardId: json['board_id'],
        labels: json["labels"] != null
            ? List<String>.from(json["labels"].map(
                (x) => x.toString(),
              ))
            : null,
        itemImage: json['itemImage'],
        amount: (json['amount']),
        // itemDate: json['itemDate'],
      );
}

class Label {
  final String id;
  final int total;
  final int count;
  Label({
    this.id,
    this.total,
    this.count,
  });

  factory Label.fromMap(Map<String, dynamic> json) => Label(
        id: json["_id"],
        total: json['total'],
        count: json['count'],
      );

  @override
  String toString() {
    return id;
  }
}
