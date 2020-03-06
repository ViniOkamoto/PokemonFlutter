import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/home/home_controller.dart';

class OtherPage extends StatefulWidget {
  final String text;
  final String title;
  const OtherPage({Key key, this.title = "Other", this.text}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(""),
      ),
    );
  }
}
