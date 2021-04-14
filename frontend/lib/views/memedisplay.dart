import 'package:flutter/material.dart';
import 'package:xmeme/views/components/backdrop.dart';
import 'package:xmeme/views/components/displaymemebuilder.dart';
import 'package:xmeme/views/components/title.dart';


// Browse Memes 
class MemeDisplay extends StatefulWidget {
  @override
  _MemeDisplayState createState() => _MemeDisplayState();
}

class _MemeDisplayState extends State<MemeDisplay> {

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
              Expanded(child: DisplayMemeBuilder())
            ]
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.pushNamed(context, "/addmeme");
        },
        tooltip: "Add New Meme",
        child: Icon(Icons.add_a_photo)
      ),
    );
  }
}