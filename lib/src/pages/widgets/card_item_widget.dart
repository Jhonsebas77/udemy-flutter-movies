import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String urlPoster;
  const CardItem({
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
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
