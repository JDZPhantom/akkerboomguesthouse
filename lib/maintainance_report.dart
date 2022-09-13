import 'package:akkerboomguesthouseapp/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Maintain_report extends StatefulWidget {
  Maintain_report({Key ?key}) : super(key: key);

  @override
  _Maintain_reportState createState() => _Maintain_reportState();
}

class _Maintain_reportState extends State<Maintain_report> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(image:  DecorationImage(
        image: AssetImage("assets/mainReport.png"),
        fit: BoxFit.fitWidth,
        // colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.2),BlendMode.dstATop)
      )
      ),);
  }


}
