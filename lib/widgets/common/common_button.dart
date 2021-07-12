import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Widget navWidget;
  CustomButton({Key key, this.btnText, this.navWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return navWidget;
              }))
            },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black38),
            child: Text(
              btnText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )));
  }
}
