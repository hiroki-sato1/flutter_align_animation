import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedAlignPage(),
    );
  }
}

class AnimatedAlignPage extends StatefulWidget {
  static const routeName = 'animatedAlign';

  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

// https://gist.github.com/mono0926/c635df629cfc69dd398ba0d2735759de#file-animated_align-dart
// 参考に作成
class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: AnimatedAlign(
        alignment: _alignment,
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
        curve: Curves.easeInOut,
      ),
    );
  }
}
