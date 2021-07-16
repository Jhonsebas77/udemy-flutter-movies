import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      child: CarouselSlider.builder(
        itemCount: movies!.length,
        itemBuilder: (
          context,
          index,
          realIndex,
        ) {
          return Hero(
            tag: movies![index].uniqueId,
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
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          height: _screenSize.height * 0.5,
        ),
      ),
    );
  }
}
