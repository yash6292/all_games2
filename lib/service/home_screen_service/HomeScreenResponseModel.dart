import 'dart:convert';

class HomeScreenResponseModel {
  HomeScreenResponseModel({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory HomeScreenResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.category,
  });

  Category? category;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category?.toJson(),
      };
}

class Category {
  Category(
      {this.popular,
      this.adventure,
      this.racing,
      this.action,
      this.puzzle,
      this.multiPlayer,
      this.sports,
      this.girlsDreesUp,
      this.the3DGame,
      this.strategy,
      this.allGames});

  List<The3DGame>? popular;
  List<The3DGame>? adventure;
  List<The3DGame>? racing;
  List<The3DGame>? action;
  List<The3DGame>? puzzle;
  List<The3DGame>? multiPlayer;
  List<The3DGame>? sports;
  List<The3DGame>? girlsDreesUp;
  List<The3DGame>? the3DGame;
  List<The3DGame>? strategy;
  List<The3DGame>? allGames;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        popular: List<The3DGame>.from(
            json["Popular"]!.map((x) => The3DGame.fromJson(x))),
        adventure: List<The3DGame>.from(
            json["Adventure"]!.map((x) => The3DGame.fromJson(x))),
        racing: List<The3DGame>.from(
            json["Racing"]!.map((x) => The3DGame.fromJson(x))),
        action: List<The3DGame>.from(
            json["Action"]!.map((x) => The3DGame.fromJson(x))),
        puzzle: List<The3DGame>.from(
            json["Puzzle"]!.map((x) => The3DGame.fromJson(x))),
        multiPlayer: List<The3DGame>.from(
            json["Multi Player"]!.map((x) => The3DGame.fromJson(x))),
        sports: List<The3DGame>.from(
            json["Sports"]!.map((x) => The3DGame.fromJson(x))),
        girlsDreesUp: List<The3DGame>.from(
            json["Girls Drees Up"]!.map((x) => The3DGame.fromJson(x))),
        the3DGame: List<The3DGame>.from(
            json["3d Game"]!.map((x) => The3DGame.fromJson(x))),
        strategy: List<The3DGame>.from(
            json["Strategy"]!.map((x) => The3DGame.fromJson(x))),
        allGames: List<The3DGame>.from(
            json["All Games"]!.map((x) => The3DGame.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Popular": List<dynamic>.from(popular!.map((x) => x.toJson())),
        "Adventure": List<dynamic>.from(adventure!.map((x) => x.toJson())),
        "Racing": List<dynamic>.from(racing!.map((x) => x.toJson())),
        "Action": List<dynamic>.from(action!.map((x) => x.toJson())),
        "Puzzle": List<dynamic>.from(puzzle!.map((x) => x.toJson())),
        "Multi Player": List<dynamic>.from(multiPlayer!.map((x) => x.toJson())),
        "Sports": List<dynamic>.from(sports!.map((x) => x.toJson())),
        "Girls Drees Up":
            List<dynamic>.from(girlsDreesUp!.map((x) => x.toJson())),
        "3d Game": List<dynamic>.from(the3DGame!.map((x) => x.toJson())),
        "Strategy": List<dynamic>.from(strategy!.map((x) => x.toJson())),
        "All Games": List<dynamic>.from(allGames!.map((x) => x.toJson())),
      };
}

class The3DGame {
  The3DGame({
    this.id,
    this.gameName,
    this.gameImage,
    this.gameLink,
    this.players,
    this.isAdd,
  });

  String? id;
  String? gameName;
  String? gameImage;
  String? gameLink;
  String? players;
  bool? isAdd;

  factory The3DGame.fromJson(Map<String, dynamic> json) => The3DGame(
        id: json["id"],
        gameName: json["game_name"],
        gameImage: json["game_image"],
        gameLink: json["game_link"],
        players: json["players"],
        isAdd: json["isAdd"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_name": gameName,
        "game_image": gameImage,
        "game_link": gameLink,
        "players": players,
        "isAdd": isAdd,
      };
  static Map<String, dynamic> toMap(The3DGame games) => {
        'id': games.id,
        "game_name": games.gameName,
        "game_image": games.gameImage,
        "game_link": games.gameLink,
        "players": games.players
      };

  static String encode(List<The3DGame> games) => json.encode(
        games
            .map<Map<String, dynamic>>((games) => The3DGame.toMap(games))
            .toList(),
      );

  static List<The3DGame> decode(String games) =>
      (json.decode(games) as List<dynamic>)
          .map<The3DGame>((item) => The3DGame.fromJson(item))
          .toList();
}
