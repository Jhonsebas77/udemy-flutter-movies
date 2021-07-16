import 'package:flutter/material.dart';
import 'package:movies_app/src/models/actor_model.dart';
import 'package:movies_app/src/screens/movie_detail/widgets/actor/card_actor_item.dart';

class ActorCard extends StatelessWidget {
  final List<Actor>? actors;
  final _pageController = new PageController(
    viewportFraction: 0.3,
  );

  ActorCard({
    required this.actors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: actors!.length,
        itemBuilder: (context, index) => CardActorItem(
          urlPhoto: actors![index].getPhoto(),
          realName: actors![index].name,
          characterName: actors![index].character,
        ),
      ),
    );
  }
}
