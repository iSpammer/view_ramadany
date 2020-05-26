import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viewramadany/Components/DetailsComponent.dart';
import 'package:viewramadany/Components/models.dart';
import 'package:viewramadany/Components/movie_details_page.dart';
import 'package:viewramadany/Utils/firebaseDatabaseUtil.dart';

class MoviesListPage extends StatefulWidget {
  MoviesListPage({
    Key key,
  }) : super(key: key);

  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  FirebaseDatabaseUtil databaseUtil;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseUtil = new FirebaseDatabaseUtil();
    databaseUtil.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    databaseUtil.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _anchorToBottom = false;

    return Scaffold(
      appBar: AppBar(title: Text("Ramadany!")),
      body: Center(
        child: new FirebaseAnimatedList(
          key: new ValueKey<bool>(_anchorToBottom),
          query: databaseUtil.getUser(),
          reverse: _anchorToBottom,
          sort: _anchorToBottom
              ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
              : null,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return new SizeTransition(
              sizeFactor: animation,
              child: showMovies(snapshot, context),
            );
          },
        ),
      ),
    );
  }
}

String getShortName(Movie movie) {
  String shortName = "";
  if (movie.title.isNotEmpty) {
    shortName = movie.title.substring(0, 1);
  }
  return shortName;
}

Widget showMovies(DataSnapshot res, context) {
  Movie movie = Movie.fromSnapshot(res);
  print(res.value['actors']);
  print("meawww");

  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute<void>(
          builder: (BuildContext context) => MovieDetailsPage(movie),
        ));
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            movie.posterUrl,
          ),
          radius: 25,
        ),
        title: Text(movie.title),
        subtitle: Text(movie.storyline.substring(0, 40) + "..."),
        trailing: Text(
          movie.rating + "/" + movie.starRating,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );

//    new Card(
//    child: new Container(
//        child: new Center(
//          child: new Row(
//            children: <Widget>[
//              new CircleAvatar(
//                radius: 30.0,
//                child: new Text(getShortName(movie)),
//                backgroundColor: const Color(0xFF20283e),
//              ),
//              new Expanded(
//                child: new Padding(
//                  padding: EdgeInsets.all(10.0),
//                  child: new Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      new Text(
//                        movie.title,
//                        // set some style to text
//                        style: new TextStyle(
//                            fontSize: 20.0, color: Colors.lightBlueAccent),
//                      ),
//                      new Text(
//                        movie.bannerUrl,
//                        // set some style to text
//                        style: new TextStyle(
//                            fontSize: 20.0, color: Colors.lightBlueAccent),
//                      ),
//                      new Text(
//                        movie.posterUrl,
//                        // set some style to text
//                        style:
//                            new TextStyle(fontSize: 20.0, color: Colors.amber),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
//  );
}
