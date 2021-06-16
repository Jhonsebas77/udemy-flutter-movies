import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      width: double.infinity,
      height: 300,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network('https://picsum.photos/300/300');
        },
        itemCount: 3,
        itemHeight: 300,
        itemWidth: 300,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
