import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  final movieProvider = new MoviesProvider();

  @override
  String get searchFieldLabel => 'Find Movies';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(
          context,
          null,
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: movieProvider.findMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView(
            children: movies.map(
              (_movie) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(
                      _movie.getPosterImage(),
                    ),
                    placeholder: AssetImage(
                      'Assets/images/no-image.jpg',
                    ),
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    _movie.title,
                  ),
                  subtitle: Text(
                    _movie.originalTitle,
                  ),
                  onTap: () {
                    showResults(context);
                    _movie.uniqueId = '';
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: _movie,
                    );
                  },
                );
              },
            ).toList(),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
