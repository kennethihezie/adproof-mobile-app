import 'package:adproof/app/routes.dart';
import 'package:adproof/utils/button.dart';
import 'package:adproof/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import '../../utils/labelled_input.dart';
import '../../utils/text_widget.dart';
import 'package:go_router/go_router.dart';

/// Created by collins ihezie on 10/05/23

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({Key? key}) : super(key: key);

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _firstNameValidator = false;
  bool _lastNameValidator = false;
  bool _emailNameValidator = false;
  bool _passwordNameValidator = false;
  bool _obscureText = true;

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

                    Center(child: SizedBox(width: 250,  child: textWidget(text: 'Register now to enjoy maximum security and advanced protection on the internet', fontWeight: FontWeight.w400, fontSize: 14, color: AdProofColors.A140033.withOpacity(0.6), textAlign: TextAlign.center))),

                    const SizedBox(height: 40,),


                    Padding(padding: const EdgeInsets.all(24), child: Column(children: [
                      LabelledInput(controller: _firstNameController, label: 'First name', inputAction: TextInputAction.next, textInputType: TextInputType.text, hint: 'first name', isError: _firstNameValidator, errorMsg: 'Invalid first name!',
                        onChange: (text){
                        setState(() {
                          if(text.isNotEmpty){
                            _firstNameValidator = false;
                          }
                        });
                      },),

                      const SizedBox(height: 14,),

                      LabelledInput(controller: _lastNameController, label: 'Last name', inputAction: TextInputAction.next, textInputType: TextInputType.text, hint: 'last name', isError: _lastNameValidator, errorMsg: 'Invalid last name!', onChange: (text){
                        setState(() {
                          if(text.isNotEmpty){
                            _lastNameValidator = false;
                          }
                        });
                      }),

                      const SizedBox(height: 14,),

                      LabelledInput(controller: _emailController, label: 'Email', inputAction: TextInputAction.next, textInputType: TextInputType.emailAddress, hint: 'email', isError: _emailNameValidator, errorMsg: 'Invalid email!',
                          onChange: (text){
                            setState(() {
                              if(text.isNotEmpty){
                                _emailNameValidator = false;
                              }
                            });
                          }),

                      const SizedBox(height: 14,),

                      LabelledInput(controller: _passwordController, label: 'Password', obscureText: _obscureText, inputAction: TextInputAction.done, hint: 'password', isPassword: true, isError: _passwordNameValidator, errorMsg: 'Invalid password!',textInputType: TextInputType.visiblePassword, toggleObscureText: (){
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                          onChange: (text){
                            setState(() {
                              if(text.isNotEmpty){
                                _passwordNameValidator = false;
                              }
                            });
                          }
                      ),

                      const SizedBox(height: 24,),

                      CustomButton(title: 'Sign up', callback: () => {
                        if(_validate()){
                          context.push(AdProofRoutes.otpPage, extra: _emailController.text)
                        }
                      },),

                      const SizedBox(height: 24,),

                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Have an account? ',
                              style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 12.0),
                            ),

                            TextSpan(
                              text: 'Sign in',
                              style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 12.0),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(AdProofRoutes.login);
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
      if(_firstNameController.text.isEmpty){
        _firstNameValidator = true;
      } else {
        _firstNameValidator = false;
      }
      if(_lastNameController.text.isEmpty){
        _lastNameValidator = true;
      } else {
        _lastNameValidator = false;
      }
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


    if(!_firstNameValidator && !_lastNameValidator && !_emailNameValidator && !_passwordNameValidator){
      return true;
    }
    return false;
  }
}
