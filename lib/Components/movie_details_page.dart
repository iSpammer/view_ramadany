import 'package:flutter/material.dart';
import 'package:viewramadany/Components/photo_scroller.dart';
import 'package:viewramadany/Components/channel.dart';
import 'package:viewramadany/Components/story_line.dart';

import 'actor_scroller.dart';
import 'models.dart';
import 'movie_detail_header.dart';

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    List<Actor> tmp = List<Actor>();
    for (int i = 0; i < movie.actors.length; i++) {
      tmp.add(new Actor(movie.actors[i]["name"], movie.actors[i]["avatarUrl"]));
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Storyline(movie.storyline),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Channel(movie),
            ),
            PhotoScroller(movie.photoUrls),
            SizedBox(height: 20.0),
            ActorScroller(tmp),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
