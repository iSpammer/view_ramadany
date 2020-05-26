import 'package:flutter/material.dart';

import 'models.dart';

class Channel extends StatelessWidget {
  Channel(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Watch On',
        style: textTheme.subhead.copyWith(fontSize: 18.0),
      ),
      SizedBox(height: 8.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            movie.channel[0],
            style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 16.0,
            ),
          ),
          Text(
            movie.channel[1],
            style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      SizedBox(height: 8.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            movie.displaytime[0],
            style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 16.0,
            ),
          ),
          Text(
            movie.displaytime[1],
            style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      SizedBox(height: 8.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            movie.redisplaytime[0],
            style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 10.0,
            ),
          ),
          Text(
            movie.redisplaytime[1],
            style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 10.0,
            ),
          ),
        ],
      )
    ]);
//        ),
    // No expand-collapse in this tutorial, we just slap the "more"
    // button below the text like in the mockup.
  }
}
