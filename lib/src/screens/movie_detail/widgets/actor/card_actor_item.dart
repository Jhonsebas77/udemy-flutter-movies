import 'package:flutter/material.dart';

class CardActorItem extends StatelessWidget {
  final String urlPhoto;
  final String? characterName;
  final String? realName;

  const CardActorItem({
    required this.urlPhoto,
    required this.characterName,
    required this.realName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  characterName!,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  // style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  //       fontSize: 10,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                ),
                Text(
                  realName!,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  // style: Theme.of(context).textTheme.caption!.copyWith(
                  //       fontSize: 10,
                  //     ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
