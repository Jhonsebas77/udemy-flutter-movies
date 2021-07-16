import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/screens/widgets/poster_movie/card_item_widget.dart';

class SwipperCard extends StatelessWidget {
  final List<Movie>? movies;

  const SwipperCard({
    required this.movies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Swiper(
        itemCount: movies!.length,
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          movies![index].uniqueId = '${movies![index].id}-card';
          return Hero(
            tag: movies![index].uniqueId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: GestureDetector(
                child: CardItem(
                  urlPoster: movies![index].getPosterImage(),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: movies![index],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
