import 'package:flutter/material.dart';

class CardPopularItem extends StatelessWidget {
  final String urlPoster;
  const CardPopularItem({
    @required this.urlPoster,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeInImage(
        placeholder: AssetImage(
          'Assets/images/jar-loading.gif',
        ),
        image: NetworkImage(
          urlPoster,
        ),
        fadeInDuration: Duration(
          milliseconds: 200,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
