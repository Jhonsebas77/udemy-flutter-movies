import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(
          '${movie.title}',
        ),
      ),
    );
  }
}
