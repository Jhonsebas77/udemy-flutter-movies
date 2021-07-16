import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String urlPoster;
  const CardItem({
    required this.urlPoster,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.5,
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
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
