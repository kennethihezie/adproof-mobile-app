import 'package:adproof/app/routes.dart';
import 'package:adproof/utils/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import '../../utils/helper.dart';
import '../../utils/labelled_input.dart';
import '../../utils/text_widget.dart';
import 'package:go_router/go_router.dart';

/// Created by collins ihezie on 10/05/23

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _emailNameValidator = false;
  bool _passwordNameValidator = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 24.0),
                      child: Align(alignment: Alignment.bottomLeft, child: InkWell(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(12)),

                          //Am using defaultTargetPlatform to determine the device and display the native icon
                          child: Icon(defaultTargetPlatform == TargetPlatform.iOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back),
                        ),
                      ),),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

                    Center(child: Image.asset('images/logo.png')),

                    const SizedBox(height: 21,),

                    Center(child: SizedBox(width: 250,  child: textWidget(text: 'Login now to access super fasting streaming.', fontWeight: FontWeight.w400, fontSize: 14, color: AdProofColors.A140033.withOpacity(0.6), textAlign: TextAlign.center))),

                    const SizedBox(height: 60,),

                    Padding(padding: const EdgeInsets.all(24), child: Column(children: [
                      LabelledInput(controller: _emailController, label: 'Email', inputAction: TextInputAction.next, textInputType: TextInputType.emailAddress, hint: 'Enter email',  isError: _emailNameValidator, errorMsg: 'Invalid email!', onChange: (text){
                        setState(() {
                          if(text.isNotEmpty){
                            _emailNameValidator = false;
                          }
                        });
                      }),

                      const SizedBox(height: 14,),

                      LabelledInput(controller: _passwordController, label: 'Password', obscureText: _obscureText, inputAction: TextInputAction.done, textInputType: TextInputType.visiblePassword, isPassword: true, hint: 'Enter password', isError: _passwordNameValidator, errorMsg: 'Password incorrect', toggleObscureText: (){
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },onChange: (text){
                        setState(() {
                          if(text.isNotEmpty){
                            _passwordNameValidator = false;
                          }
                        });
                      }),

                      const SizedBox(height: 15,),

                      InkWell(
                        onTap: () => context.push(AdProofRoutes.forgotPassword),
                        child: Align(alignment: Alignment.centerRight, child: textWidget(text: 'Forgot password?', fontWeight: FontWeight.w500, fontSize: 14),),
                      ),

                      const SizedBox(height: 24,),

                      CustomButton(title: 'Login', callback: () => {
                        if(_validate()){
                          Helper.showToast("Success")
                        }
                      },),

                      const SizedBox(height: 24,),

                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 12.0),
                            ),

                            TextSpan(
                              text: 'Sign up',
                              style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 12.0),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(AdProofRoutes.signUp);
                                },
                            )
                          ]
                      ),)

                    ],),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool _validate(){
    setState(() {
      if(_emailController.text.isEmpty && !Helper.emailRegex(_emailController.text)){
        _emailNameValidator = true;
      } else {
        _emailNameValidator = false;
      }
      if(_passwordController.text.isEmpty){
        _passwordNameValidator = true;
      } else {
        _passwordNameValidator = false;
      }
    });


    if(!_emailNameValidator && !_passwordNameValidator){
      return true;
    }
    return false;
  }
}
