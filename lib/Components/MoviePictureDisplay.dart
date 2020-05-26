import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MoviePictureDisplay extends StatelessWidget {
  final String picturePath;

  MoviePictureDisplay({@required this.picturePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider: AssetImage("$picturePath"),
    ));
  }
}
