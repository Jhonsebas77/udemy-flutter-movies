import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/screens/widgets/popular_movie/card_popular_item.dart';

class CardPopular extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  CardPopular({
    @required this.movies,
    @required this.nextPage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(
      () {
        if (_pageController.position.pixels >=
            _pageController.position.maxScrollExtent - 200) {
          nextPage();
        }
      },
    );

    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      height: _screenSize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          movies[index].uniqueId = '${movies[index].id}-popular';
          return GestureDetector(
            child: CardPopularItem(
              urlPoster: movies[index].getPosterImage(),
              movieTitle: movies[index].title,
              movieUniqueId: movies[index].uniqueId,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: movies[index],
              );
            },
          );
        },
      ),
    );
  }
}
