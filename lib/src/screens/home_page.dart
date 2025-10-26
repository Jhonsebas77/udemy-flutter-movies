import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movies_provider.dart';
import 'package:movies_app/src/screens/widgets/popular_movie/card_popular_movie.dart';
import 'package:movies_app/src/screens/widgets/poster_movie/card_swipper_widget.dart';
import 'package:movies_app/src/search/search_delegate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    moviesProvider.getPopular();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
                // query: 'Hola',
              );
            },
          ),
        ],
        title: Text('Movies in theathers'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSwiperCard(moviesProvider),
            SizedBox(height: 20),
            _buildFooter(context, moviesProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildSwiperCard(MoviesProvider moviesProvider) => FutureBuilder(
    future: moviesProvider.getNowPlaying(),
    builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
      if (snapshot.hasData) {
        return SwipperCard(movies: snapshot.data);
      } else {
        return Container(
          height: 400,
          child: Center(child: CircularProgressIndicator()),
        );
      }
    },
  );

  Widget _buildFooter(BuildContext context, MoviesProvider moviesProvider) =>
      Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10), child: Text('Popular')),
            SizedBox(height: 5),
            StreamBuilder(
              stream: moviesProvider.popularStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return CardPopular(
                    movies: snapshot.data as List<Movie>?,
                    nextPage: moviesProvider.getPopular,
                  );
                } else {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ],
        ),
      );
}
