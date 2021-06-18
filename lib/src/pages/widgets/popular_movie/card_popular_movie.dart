import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/pages/widgets/popular_movie/card_popular_item.dart';

class CardPopular extends StatelessWidget {
  final List<Movie> movies;

  const CardPopular({
    @required this.movies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      height: _screenSize.height * 0.3,
      child: PageView(
        pageSnapping: false,
        children: _cards(),
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
      ),
    );
  }

  List<Widget> _cards() {
    return movies
        .map(
          (_movie) => CardPopularItem(
            urlPoster: _movie.getPosterImage(),
            movieTitle: _movie.title,
          ),
        )
        .toList();
  }
}
