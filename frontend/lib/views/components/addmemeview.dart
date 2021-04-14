import 'package:flutter/material.dart';
import 'package:xmeme/controller/meme.dart';
import 'package:xmeme/model/meme.dart';
import 'package:xmeme/views/components/textfield.dart';


// Add meme widget/component structure to build using the builder for 
// various layouts
class AddMemeView extends StatefulWidget {
  @override
  _AddMemeViewState createState() => _AddMemeViewState();
}

class _AddMemeViewState extends State<AddMemeView> {
  // Actions controller creating a new meme
  final controller = new MemeController();

  // TextField Component Controllers
  final usernameController = new TextEditingController();
  final captionController = new TextEditingController();
  final linkController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    captionController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add new Meme",
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: "Monserrat"
            ),
          ),
          SizedBox(height: 20.0,),
          TextFieldComponent(
            controller: usernameController,
            hintText: "Username",
            icon: Icons.perm_identity,
          ),
          SizedBox(height: 10.0,),
          TextFieldComponent(
            controller: captionController,
            hintText: "Caption",
            icon: Icons.closed_caption,
          ),
          SizedBox(height: 10.0,),
          TextFieldComponent(
            controller: linkController,
            hintText: "Url",
            icon: Icons.http_outlined
          ),
          SizedBox(height: 20.0,),
          MaterialButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                MemeModel model = new MemeModel(usernameController.text, captionController.text, linkController.text);
                if (await controller.postMeme(model)) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Meme added successfully!!!')));
                  Navigator.of(context).pop();
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Failed to add the meme')));
                  Navigator.of(context).pop();
                }
              }
            },
            elevation: 20.0,
            minWidth: 100.0,
            height: 50.0,
            color: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Text(
              "Submit",
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),
          SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}