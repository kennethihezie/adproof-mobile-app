import 'package:adproof/app/routes.dart';
import 'package:adproof/utils/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import '../../utils/labelled_input.dart';
import '../../utils/text_widget.dart';
import 'package:go_router/go_router.dart';

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
  bool obscureText = true;

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
                      LabelledInput(controller: _firstNameController, label: 'First name', inputAction: TextInputAction.next, textInputType: TextInputType.text, hint: 'Enter first name',),

                      const SizedBox(height: 14,),

                      LabelledInput(controller: _lastNameController, label: 'Last name', inputAction: TextInputAction.next, textInputType: TextInputType.text, hint: 'Enter last name'),

                      const SizedBox(height: 14,),

                      LabelledInput(controller: _emailController, label: 'Email', inputAction: TextInputAction.next, textInputType: TextInputType.emailAddress, hint: 'Enter email'),

                      const SizedBox(height: 14,),

                      LabelledInput(controller: _passwordController, label: 'Password', obscureText: obscureText, inputAction: TextInputAction.done, hint: 'Enter password', isPassword: true, textInputType: TextInputType.visiblePassword, toggleObscureText: (){
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },),

                      const SizedBox(height: 24,),

                      CustomButton(title: 'Sign up', callback: () => context.push(AdProofRoutes.otpPage, extra: _emailController.text),),

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
}
