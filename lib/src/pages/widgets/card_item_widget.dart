import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeInImage(
        placeholder: AssetImage(
          'Assets/images/jar-loading.gif',
        ),
        image: NetworkImage(
          'https://picsum.photos/300/300',
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
