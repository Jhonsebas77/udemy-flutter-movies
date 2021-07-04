import 'package:flutter/material.dart';
import 'package:movies_app/src/screens/movie_detail/widgets/rate_stars.dart';

class TitlePoster extends StatelessWidget {
  final String urlPosterImage;
  final String movieTitle;
  final String movieUniqueId;
  final String movieOriginalTitle;
  final String voteAverage;

  const TitlePoster({
    @required this.urlPosterImage,
    @required this.movieTitle,
    @required this.movieUniqueId,
    @required this.movieOriginalTitle,
    @required this.voteAverage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Hero(
            tag: movieUniqueId,
            child: ClipRRect(
              child: Image(
                image: NetworkImage(
                  urlPosterImage,
                ),
                height: 150,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieTitle,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movieOriginalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                RateStars(
                  voteAverage: voteAverage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
