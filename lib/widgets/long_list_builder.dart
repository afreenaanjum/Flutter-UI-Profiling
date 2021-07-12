import 'package:flutter/material.dart';
import 'package:ui_profiling/utils/utils.dart';

class LongListBuilder extends StatefulWidget {
  LongListBuilder({
    Key key,
  }) : super(key: key);

  @override
  _LongListBuilderState createState() => _LongListBuilderState();
}

class _LongListBuilderState extends State<LongListBuilder>
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
          title: Text("Lengthy List Builder"),
        ),
        body: ListView.builder(
          itemCount: 10000,
          itemBuilder: (context, index) {
            return ListItem(index, _offsetAnimation);
          },
        ));
  }
}

class ListItem extends StatelessWidget {
  final int index;
  final Animation animation;

  ListItem(this.index, this.animation);

  @override
  Widget build(BuildContext context) {
    if (index < 10)
      return SlideTransition(
        position: animation,
        child: ListCard(index: index),
      );
    return ListCard(index: index);
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      elevation: 11,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(index: index),
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
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/400x300_${getImage(index)}",
            ),
          ),
          borderRadius: BorderRadius.circular(200)),
      margin: EdgeInsets.only(
        right: 20,
      ),
      width: 100,
      height: 100,
    );
  }
}
