import 'dart:convert';

class JokeModel {
    JokeModel({
        required this.id,
        required this.type,
        required this.setup,
        required this.punchline,
    });

    final int id;
    final String type;
    final String setup;
    final String punchline;

    factory JokeModel.fromJson(String str) => JokeModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JokeModel.fromMap(Map<String, dynamic> json) => JokeModel(
        id: json["id"],
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "setup": setup,
        "punchline": punchline,
    };
}
