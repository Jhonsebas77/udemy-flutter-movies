import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

class MovieSuggestionItem extends StatelessWidget {
  final Movie movie;

  const MovieSuggestionItem({
    @required this.movie,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        image: NetworkImage(
          movie.getPosterImage(),
        ),
        placeholder: AssetImage(
          'Assets/images/no-image.jpg',
        ),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(
        movie.title,
      ),
      subtitle: Text(
        movie.originalTitle,
      ),
      onTap: () {
        movie.uniqueId = '';
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: movie,
        );
      },
    );
  }
}
