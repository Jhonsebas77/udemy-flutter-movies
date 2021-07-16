import 'package:flutter/material.dart';
import 'package:movies_app/src/models/actor_model.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movies_provider.dart';
import 'package:movies_app/src/screens/movie_detail/widgets/index.dart';
import 'package:provider/provider.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings?.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          HeaderBackground(
            backgroundUrl: movie.getHeaderImage(),
            movieTitle: movie.title,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10.0,
                ),
                TitlePoster(
                  urlPosterImage: movie.getPosterImage(),
                  movieOriginalTitle: movie.originalTitle,
                  movieTitle: movie.title,
                  voteAverage: movie.voteAverage.toString(),
                  movieUniqueId: movie.uniqueId,
                ),
                _buildDescriptionMovie(
                  movie.overview!,
                  context,
                ),
                _buildCasting(
                  movie.id,
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionMovie(
    String overview,
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildCasting(
    int? id,
    BuildContext context,
  ) {
    final movieProvider = Provider.of<MoviesProvider>(
      context,
      listen: false,
    );
    return FutureBuilder(
      future: movieProvider.getActor(id),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Actor>?> snapshot,
      ) {
        if (snapshot.hasData) {
          return ActorCard(
            actors: snapshot.data,
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
  }
}
