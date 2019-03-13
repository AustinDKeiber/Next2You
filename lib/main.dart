import 'package:flutter/material.dart';

import './map_area.dart';

void main() => runApp(Next2You());

class Next2You extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Main();
  }
}

class Main extends State<Next2You> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MappingArea(),
    );
  }
}
