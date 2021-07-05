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
      backgroundColor: Colors.black,
      expandedHeight: 188.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              movieTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          background: Stack(
            children: [
              FadeInImage(
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
              Container(
                decoration: buildDecorationGradient(),
              ),
            ],
          )),
    );
  }

  BoxDecoration buildDecorationGradient() {
    final colorGradientGray = LinearGradient(
      colors: [
        Colors.transparent,
        Colors.transparent,
        Colors.black12,
        Colors.black38,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return BoxDecoration(
      gradient: colorGradientGray,
    );
  }
}
