import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final ROUTE_NAME = 'homescreen';

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/home-bg.png"), fit: BoxFit.fill)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            //appBar: AppBar(),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 72),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HOME SCREEEN"),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
