import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController myController;
  String labelName;
  bool type;
  bool editable;
  TextFieldWidget(this.myController, this.labelName, this.type, {
    this.editable = true,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool showPass=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: GoogleFonts.almarai(
          height: 1.5,
          fontSize: 18,
        ),
        cursorColor: Colors.black,
        autocorrect: true,
        obscureText: widget.type?!showPass:false,
        enabled: widget.editable,
        decoration: InputDecoration(
          hintText: widget.labelName,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xffcccccc)),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xffff3333)),
            borderRadius: BorderRadius.circular(20),
          ),

        ),
      ),
    );
  }
}
