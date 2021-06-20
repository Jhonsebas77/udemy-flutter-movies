import 'package:flutter/material.dart';

class CardPopularItem extends StatelessWidget {
  final String urlPoster;
  final String movieTitle;
  final String movieId;

  const CardPopularItem({
    @required this.urlPoster,
    @required this.movieTitle,
    @required this.movieId,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 15.0,
      ),
      child: Column(
        children: [
          Hero(
            tag: movieId,
            child: ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage(
                  'Assets/images/no-image.jpg',
                ),
                image: NetworkImage(
                  urlPoster,
                ),
                fadeInDuration: Duration(
                  milliseconds: 200,
                ),
                fit: BoxFit.cover,
                height: 160,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Text(
            movieTitle,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
