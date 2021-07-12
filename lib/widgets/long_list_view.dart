import 'package:flutter/material.dart';
import 'package:ui_profiling/utils/utils.dart';

class LongListView extends StatefulWidget {
  LongListView({
    Key key,
  }) : super(key: key);

  @override
  _LongListViewState createState() => _LongListViewState();
}

class _LongListViewState extends State<LongListView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _controller = initialiseController(const Duration(milliseconds: 700), this);
    _offsetAnimation = setAnimation(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lengthy List View"),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 10000; i++) _buildLongList(i, _offsetAnimation)
        ],
      ),
    );
  }

  Widget _buildLongList(var index, Animation animation) {
    return SlideTransition(
      position: animation,
      child: Card(
        elevation: 11,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/${getImage(index)}"),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  '${getUserName(index)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
