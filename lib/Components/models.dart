import 'package:firebase_database/firebase_database.dart';

class Movie {
  String key;
  String bannerUrl;
  String posterUrl;
  String title;
  String rating;
  String starRating;
  List<String> categories;
  String storyline;
  List<String> photoUrls;
  var actors;
  List<String> channel;
  String type;
  List<String> displaytime;
  List<String> redisplaytime;

  Movie(
      this.key,
      this.bannerUrl,
      this.posterUrl,
      this.title,
      this.rating,
      this.starRating,
      this.categories,
      this.storyline,
      this.photoUrls,
      this.actors,
      this.channel,
      this.type,
      this.displaytime,
      this.redisplaytime);

  Movie.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        bannerUrl = snapshot.value["bannerUrl"],
        posterUrl = snapshot.value["posterUrl"],
        title = snapshot.value["title"],
        rating = snapshot.value["rating"].toString(),
        starRating = snapshot.value["starRating"].toString(),
        categories = List<String>.from(snapshot.value["categories"]),
        storyline = snapshot.value["storyline"],
        photoUrls = List<String>.from(snapshot.value["photoUrls"]),
        actors = snapshot.value["actors"],
        channel = List<String>.from(snapshot.value["channel"]),
        type = snapshot.value["type"],
        displaytime = List<String>.from(snapshot.value["displaytime"]),
        redisplaytime = List<String>.from(snapshot.value["redisplaytime"]);


  toJson() {
    return {
      "bannerUrl": bannerUrl,
      "posterUrl": posterUrl,
      "title": title,
      "rating": rating,
      "starRating": starRating,
//      "categories": categories,
      "storyline": storyline,
//      "photoUrls": photoUrls,
//      "actors": actors,
    };
  }
}

class Actor {
  final String name;
  final String avatarUrl;

  Actor(
    this.name,
    this.avatarUrl,
  );
}

class ItemData {
  String identifier;
  String name;

  ItemData(this.identifier, this.name);
}
