import 'package:flutter/material.dart';
import 'package:movies_app/src/screens/movie_detail/widgets/index.dart';

class TitlePoster extends StatelessWidget {
  final String urlPosterImage;
  final String? movieTitle;
  final String? movieUniqueId;
  final String? movieOriginalTitle;
  final String voteAverage;

  const TitlePoster({
    required this.urlPosterImage,
    required this.movieTitle,
    required this.movieUniqueId,
    required this.movieOriginalTitle,
    required this.voteAverage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Hero(
            tag: movieUniqueId!,
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
                  movieTitle!,
                  style: textTheme.textTheme.headline6,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movieOriginalTitle!,
                  maxLines: 2,
                  style: textTheme.textTheme.subtitle1,
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
