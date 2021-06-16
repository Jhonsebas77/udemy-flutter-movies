import 'package:flutter/material.dart';
import 'package:movies_app/src/pages/widgets/card_swipper_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          'Movies in theathers',
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          child: Column(
        children: [
          _buildSwiperCard(),
        ],
      )),
    );
  }

  Widget _buildSwiperCard() {
    return SwipperCard(
      movies: [0, 1, 2, 3, 4],
    );
  }
}
