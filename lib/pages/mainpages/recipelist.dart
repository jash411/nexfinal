import 'package:flutter/material.dart';
import 'recipe.dart';
class recipelist extends StatefulWidget {
  final rlist recipe;
  const recipelist({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<recipelist> createState() => _recipelistState();
}


class File {
  final String Body;
  const File({
    required this.Body,
  });
}

class _recipelistState extends State<recipelist> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blueGrey[900],
    appBar: AppBar(
      backgroundColor: Colors.grey[900],
      title: Text(widget.recipe.Title),
    ),
    body: SingleChildScrollView(
      child: Center(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            _previousScale = _scale;
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _scale = _previousScale * details.scale;
            });
          },
          onDoubleTap: () {
            setState(() {
              _scale = 1.0;
            });
          },
          child: Transform.scale(
            scale: _scale,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectableText(
                widget.recipe.Body,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  }

