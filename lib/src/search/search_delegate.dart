import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final movies = [
    'EndGame',
    'Capitana Marvel',
    'Capitan America',
    'Spiderman',
    'Pokemon',
  ];
  final recentMovies = [
    'Spiderman',
    'Capitan America',
  ];
  String sellection;

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
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.amberAccent,
        child: Text(sellection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listSuggest = (query.isEmpty)
        ? recentMovies
        : movies
            .where(
              (_movie) => _movie.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return ListView.builder(
      itemCount: listSuggest.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.movie,
          ),
          title: Text(
            listSuggest[index],
          ),
          onTap: () {
            sellection = listSuggest[index];
            showResults(context);
          },
        );
      },
    );
  }
}
