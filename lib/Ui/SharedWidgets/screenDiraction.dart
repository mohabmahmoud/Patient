

import 'package:flutter/material.dart';
import '../../Core/Language/LangVariables.dart';




class screenDiraction extends StatefulWidget {
  Widget child;
   screenDiraction({required this.child,Key? key}) : super(key: key);

  @override
  State<screenDiraction> createState() => _screenDiractionState();
}

class _screenDiractionState extends State<screenDiraction> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: direction, child: widget.child);
  }
}



