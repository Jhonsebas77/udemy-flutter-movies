import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10.0,
                ),
                _buildTitlePoster(movie, context),
                _buildDescriptionMovie(movie, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.redAccent,
      expandedHeight: 192.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          placeholder: AssetImage(
            'Assets/images/loading.gif',
          ),
          image: NetworkImage(
            movie.getHeaderImage(),
          ),
          fadeInDuration: Duration(
            milliseconds: 200,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitlePoster(Movie movie, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image(
              image: NetworkImage(
                movie.getPosterImage(),
              ),
              height: 150,
            ),
            borderRadius: BorderRadius.circular(
              20,
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
                  movie.title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                _buildStar(movie.voteAverage, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStar(double voteAverage, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_border),
        Text(
          voteAverage.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Widget _buildDescriptionMovie(Movie movie, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
