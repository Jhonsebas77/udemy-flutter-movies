import 'package:flutter/material.dart';

class CardActorItem extends StatelessWidget {
  final String urlPhoto;
  final String characterName;
  final String realName;

  const CardActorItem({
    @required this.urlPhoto,
    @required this.characterName,
    @required this.realName,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 15.0,
      ),
      child: Column(
        children: [
          ClipRRect(
            child: FadeInImage(
              placeholder: AssetImage(
                'Assets/images/no-image.jpg',
              ),
              image: NetworkImage(
                urlPhoto,
              ),
              fadeInDuration: Duration(
                milliseconds: 200,
              ),
              fit: BoxFit.cover,
              height: 160,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          Text(
            characterName,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            realName,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
