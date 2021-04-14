import 'package:flutter/material.dart';


// To be used whenever a input text field is required inside a form
// Parameters:
// controller to retrieve the value present in the field
// hintText to provide context of the field
// icon to display relevant icon at the suffix of the field
class TextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const TextFieldComponent({Key key, this.controller, this.hintText, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      validator: (value) {
        if (value.isEmpty) {
          return "Required!!";
        } 
        return null;
      },
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        suffixIcon: Icon(this.icon, color: Colors.black,),
        hintText: this.hintText,
        hintStyle: TextStyle(
          color: Colors.black
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        )
      ),
    );
  }
}