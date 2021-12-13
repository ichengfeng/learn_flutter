class Person {
  String? name;
  String? avatarURL;

  Person.fromMap(Map<String, dynamic> json) {
    name = json["name"];
    avatarURL = json["avatar"];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json): super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json): super.fromMap(json);
}

int counter = 1;

class MovieItem {
  int? rank;
  String? imageURL;
  String? title;
  String? playDate;
  double? rating;
  List<String>? genres;
  List<Actor>? casts;
  List<Director>? directors;
  String? originalTitle;

  MovieItem.fromMap(Map<String, dynamic> json) {
    rank = counter++;
    imageURL = json["image"];
    title = json["title"];
    playDate = json["playdate"];
    rating = json["rating"]["average"];
    genres = json["generes"].cast<String>();
    casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
    directors = (json["directors"] as List<dynamic>).map((item) {
      return Director.fromMap(item);
    }).toList();
    // Director.fromMap(json["directors"]);
    originalTitle = json["originality"];
  }

  @override
  String toString() {
    return 'MovieItem{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $directors, originalTitle: $originalTitle}';
  }
}