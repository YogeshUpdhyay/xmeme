import 'package:flutter/material.dart';
import 'package:xmeme/views/components/addmemebuilder.dart';
import 'package:xmeme/views/components/backdrop.dart';
import 'package:xmeme/views/components/title.dart';


// Add Meme Page Layout of the App
class AddMeme extends StatefulWidget {
  @override
  _AddMemeState createState() => _AddMemeState();
}

class _AddMemeState extends State<AddMeme> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, size.height),
            painter: BackDrop(),
          ),
          Column (
            children: [
              TitleComponent(),
              SizedBox(height: size.height*0.25,),
              AddMemeBuilder()
            ]
          ),
        ]
      )
    );
  }
}