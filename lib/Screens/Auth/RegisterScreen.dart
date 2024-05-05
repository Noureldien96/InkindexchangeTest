import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarfkind_apitest/Screens/Widgets/ButtonWidget.dart';
import 'package:sarfkind_apitest/Screens/Widgets/TextFieldWidget.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController agentNumberController = TextEditingController();
  TextEditingController agentNameController = TextEditingController();
  TextEditingController agentEmailController = TextEditingController();
  TextEditingController agentPhoneController = TextEditingController();
  TextEditingController agentPasswordController = TextEditingController();
  TextEditingController agentConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("إنشئ حسابك وابدء مع نماء",style: GoogleFonts.almarai(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ), ),
                  Text("المعلومات الاساسية",style: GoogleFonts.almarai(
                      fontSize: 22,
                      color: Colors.black45
                  ), ),

                  SizedBox(height: 24,),
                  TextFieldWidget(agentNumberController,'رقم المورد', true),
                  SizedBox(height: 8,),
                  TextFieldWidget(agentNameController,'اسمك', false),
                  SizedBox(height: 8,),
                  TextFieldWidget(agentNumberController,'رقم الجوال', false),
                  SizedBox(height: 8,),
                  TextFieldWidget(agentEmailController,'البريد اللالكتروني', false),
                  SizedBox(height: 8,),
                  TextFieldWidget(agentPasswordController,'كلمة المرور', false),
                  SizedBox(height: 8,),
                  TextFieldWidget(agentConfirmPasswordController,'تأكيد كلمة المرور ', false),

                  SizedBox(height: 40,),
                  ButtonWidget("سجل الآن"),
                ],
              ),
            ),
          ),
        )
    );
  }
}
