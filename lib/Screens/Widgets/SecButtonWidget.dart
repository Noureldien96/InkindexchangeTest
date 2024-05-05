import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecButtonWidget extends StatelessWidget {

  String Name;
  SecButtonWidget(this.Name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
        //border: Border.all(color: Color.fromRGBO(42, 71, 85, 1), width: 2)
      ),
      child: ElevatedButton(
        onPressed: null,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
        child: Text(Name, style: GoogleFonts.almarai(
          fontSize:18,
          fontWeight: FontWeight.bold,
          color: Color(0xff005E9D),
        ),),
      ),
    );
  }
}
