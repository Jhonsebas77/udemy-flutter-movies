import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movies_provider.dart';
import 'package:movies_app/src/search/widgets/movie_suggestion/movie_suggestion_item.dart';
import 'package:provider/provider.dart';

class DataSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Find Movies';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () => query = '',
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

  Widget _buildLoadingSearch() => Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

  Widget _buildEmptySearch() => Container(
        child: Center(
          child: Icon(
            Icons.movie,
            color: Colors.black38,
            size: 130,
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _buildEmptySearch();
    }
    final movieProvider = Provider.of<MoviesProvider>(
      context,
      listen: false,
    );
    movieProvider.getSuggestionByQuery(query);
    return StreamBuilder(
      stream: movieProvider.suggestionStream,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data!;
          return ListView(
            children: movies.map(
              (_movie) {
                return MovieSuggestionItem(
                  movie: _movie,
                );
              },
            ).toList(),
          );
        } else {
          return _buildLoadingSearch();
        }
      },
    );
  }
}
