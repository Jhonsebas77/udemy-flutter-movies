import 'package:flutter/material.dart';

class HeaderBackground extends StatelessWidget {
  final String movieTitle;
  final String backgroundUrl;

  const HeaderBackground({
    @required this.movieTitle,
    @required this.backgroundUrl,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.redAccent,
      expandedHeight: 192.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Chip(
          backgroundColor: Colors.black87,
          label: Text(
            movieTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage(
            'Assets/images/loading.gif',
          ),
          image: NetworkImage(
            backgroundUrl,
          ),
          fadeInDuration: Duration(
            milliseconds: 200,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
