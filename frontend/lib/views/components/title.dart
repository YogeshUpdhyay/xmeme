import 'package:flutter/material.dart';

// To be used as title on top of the all the pages
class TitleComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Xmeme",
        style: TextStyle(
          fontFamily: "Monserrat",
          fontSize: 30.0
        ),
      ),
    );
  }
}