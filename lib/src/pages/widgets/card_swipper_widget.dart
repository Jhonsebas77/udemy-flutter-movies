import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/src/pages/widgets/card_item_widget.dart';

class SwipperCard extends StatelessWidget {
  final List<dynamic> movies;

  const SwipperCard({
    @required this.movies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Swiper(
        itemCount: movies.length,
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) => ClipRRect(
          child: CardItem(),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}