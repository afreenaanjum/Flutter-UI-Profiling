import 'package:flutter/material.dart';
import 'package:ui_profiling/widgets/common/common_button.dart';
import 'package:ui_profiling/widgets/long_list_builder.dart';
import 'package:ui_profiling/widgets/long_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
            btnText: "Long List View",
            navWidget: LongListView(),
          ),
          CustomButton(
            btnText: "Long List Builder",
            navWidget: LongListBuilder(),
          ),
        ]),
      ),
    );
  }
}
