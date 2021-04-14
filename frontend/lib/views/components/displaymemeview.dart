import 'package:flutter/material.dart';
import 'package:xmeme/controller/meme.dart';


// Display meme widget/component structure to build using the builder for 
// various layouts
class DisplayMemeView extends StatefulWidget {
  @override
  _DisplayMemeViewState createState() => _DisplayMemeViewState();
}

class _DisplayMemeViewState extends State<DisplayMemeView> {
  // Actions controller for fetching memes
  MemeController controller = new MemeController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: controller.getMemes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          if (data.length > 0) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                          child: Text(
                            data[index].username,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Monserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0
                            ),
                          ),
                        ),
                        // Spacer(),
                        // IconButton(
                        //   icon: Icon(Icons.edit), 
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, "/editmeme");
                        //   }
                        // )
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Image.network(
                      data[index].link,
                      fit: BoxFit.contain,
                      width: size.width,
                      height: size.height*0.5,
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      data[index].caption,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0
                      ),
                    ),
                    SizedBox(height: 10.0,),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: Image.asset(
                "assets/images/3828537.jpg",
                fit: BoxFit.contain,
                width: size.width,
                height: size.height*0.5,
              ),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}