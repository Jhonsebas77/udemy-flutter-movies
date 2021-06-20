import 'package:flutter/material.dart';

class RateStars extends StatelessWidget {
  final String voteAverage;
  const RateStars({
    @required this.voteAverage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_border),
        Text(
          voteAverage,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
