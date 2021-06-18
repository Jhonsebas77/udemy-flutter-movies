import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/pages/widgets/card_popular_item.dart';

class CardPopular extends StatelessWidget {
  final List<Movie> movies;

  const CardPopular({
    @required this.movies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: 10,
        ),
        height: 200,
        width: 200,
        child: ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (
            BuildContext context,
            int index,
          ) =>
              CardPopularItem(
            urlPoster: movies[index].getPosterImage(),
          ),
        ),
      );
}
