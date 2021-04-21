class Board {
  final String id;
  final String name;
  final String description;
  final int color;
  final List<String> collaborators;
  final String boardCoverUrl;
  final boardCoverImage;
  Board({
    this.id,
    this.name,
    this.description,
    this.color,
    this.collaborators,
    this.boardCoverUrl,
    this.boardCoverImage,
  });

  factory Board.fromMap(Map<String, dynamic> json) => Board(
        id: json['id'],
        name: json["name"],
        description: json['description'],
        color: json['color'],
        collaborators: json["collaborators"] != null
            ? List<String>.from(json["collaborators"].map(
                (x) => x.toString(),
              ))
            : null,
        boardCoverImage: (json['boardCoverImage']),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "color": color,
        "collaborators": List<String>.from(collaborators.map((x) => x)),
        "boardCoverUrl": boardCoverUrl,
        "boardCoverImage": boardCoverImage,
      };
}
