import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

class MovieSuggestionItem extends StatelessWidget {
  final Movie movie;
  final String heroId;

  const MovieSuggestionItem({
    @required this.movie,
    @required this.heroId,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: heroId,
        child: FadeInImage(
          image: NetworkImage(
            movie.getPosterImage(),
          ),
          placeholder: AssetImage(
            'Assets/images/no-image.jpg',
          ),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        movie.title,
      ),
      subtitle: Text(
        movie.originalTitle,
      ),
      onTap: () {
        movie.uniqueId = '${movie.id}-searchlist';
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: movie,
        );
      },
    );
  }
}
