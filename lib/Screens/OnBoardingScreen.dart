import 'package:flutter/material.dart';
import 'package:sarfkind_apitest/Screens/Auth/LoginScreen.dart';
import 'package:sarfkind_apitest/Screens/Auth/RegisterScreen.dart';
import 'package:sarfkind_apitest/Screens/Widgets/ButtonWidget.dart';
import 'package:sarfkind_apitest/Screens/Widgets/SecButtonWidget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/SPLASH-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 400,),
                Container(
                  padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                ),
                SizedBox(height: 40,),
                Image.asset("assets/images/big-tit.png", width: 330,),
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.only(top: 48),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                          },
                          child: ButtonWidget("تسجيل دخول")),
                      SizedBox(height: 16,),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
                          },
                          child: SecButtonWidget("إنشاء حساب")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
