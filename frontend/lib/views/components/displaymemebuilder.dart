import 'package:flutter/material.dart';
import 'displaymemeview.dart';


// Responsive Layout builder for the browse memes page
class DisplayMemeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          // For screen sizes with greater than 1200
          return Container(
            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.3),
            child: DisplayMemeView()
          );
        } else {
          return Container(
            child: DisplayMemeView()
          );
        }
      }
    );
  }
}