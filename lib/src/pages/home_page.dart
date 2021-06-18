import 'package:flutter/material.dart';
import 'package:movies_app/src/pages/widgets/card_popular_movie.dart';
import 'package:movies_app/src/pages/widgets/card_swipper_widget.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          'Movies in theathers',
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSwiperCard(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSwiperCard() => FutureBuilder(
        future: moviesProvider.getNowPlaying(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List> snapshot,
        ) {
          if (snapshot.hasData) {
            return SwipperCard(
              movies: snapshot.data,
            );
          } else {
            return Container(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      );

  Widget _buildFooter(BuildContext context) => Container(
        child: Column(
          children: [
            Text(
              'Popular',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            FutureBuilder(
              future: moviesProvider.getPopular(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List> snapshot,
              ) {
                if (snapshot.hasData) {
                  return CardPopular(
                    movies: snapshot.data,
                  );
                } else {
                  return Container(
                    height: 400,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        width: double.infinity,
      );
}
