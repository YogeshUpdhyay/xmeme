import 'package:flutter/material.dart';
import 'package:xmeme/views/components/addmemeview.dart';


// Responsive Layout builder for the add meme page
class AddMemeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          // For screen sizes with greater than 1200
          return Container(
            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.3),
            child: AddMemeView()
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.1),
            child: AddMemeView()
          );
        }
      }
    );
  }
}