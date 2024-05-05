import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:sarfkind_apitest/Screens/HomeScreen.dart';
import 'package:sarfkind_apitest/Screens/Models/LoginResponse.dart';
import 'package:sarfkind_apitest/Screens/Services/LoginService.dart';
import 'package:sarfkind_apitest/Screens/Widgets/ButtonWidget.dart';
import 'package:sarfkind_apitest/Screens/Widgets/TextFieldWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/LOGIN-bg.png"), fit: BoxFit.fill)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(iconTheme: IconThemeData(color: Colors.black,),),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Center(child: Image.asset("assets/images/namaa.png", width: 280,)),
                    SizedBox(height: 16,),
                    Text("تطبيق الصرف العيني",style: GoogleFonts.almarai(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("للـمــســــــاعــــــــــــــدات",style: GoogleFonts.almarai(
                      fontSize: 22,
                    ),),

                    SizedBox(height: 24,),
                    TextFieldWidget(userNameController,'اسم المستخدم', false),
                    SizedBox(height: 16,),
                    TextFieldWidget(userPasswordController,'كلمة المرور', true),
                    SizedBox(height: 8,),
                    SizedBox(height: 40,),

                    InkWell(
                        onTap: (){
                          sendLoginApi(context);
                        },
                        child: ButtonWidget("تسجيل دخول")),

                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" ليس لديك حساب ؟ ", style: GoogleFonts.almarai(
                            fontSize:16,
                            color: Colors.black45
                        ),),
                        InkWell(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegisterScreen2()));
                          },
                          child: Text(" سجل الان ", style: GoogleFonts.almarai(
                              fontSize:16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

Future<void> sendLoginApi(BuildContext context) async{
  if(userNameController.text.isEmpty || userPasswordController.text.isEmpty){
    Fluttertoast.showToast(
        msg: "من فضلك أكمل المدخلات",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return ;
  }
  ProgressDialog pr = ProgressDialog(context, type: ProgressDialogType.normal, isDismissible: false, showLogs: true);
  try{
    await pr.show();
    LoginResponse response = await loginApi(userNameController.text.trim(), userPasswordController.text.trim());
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('sessionId', response.result!.sessionId!);
    pref.setString("apiKey", response.result!.apiKey!);

    await pr.hide();
    
    Navigator.pushNamed(context, HomeScreen.ROUTE_NAME, arguments: response);
    
    print(response.result!.login);

  }catch(e){
    Fluttertoast.showToast(
        msg: 'رقم الجوال او كلمة المرور غير صحيح',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
    await pr.hide();
  }
}



}
