import 'package:adproof/app/routes.dart';
import 'package:adproof/utils/colors.dart';
import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/outline_button.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

              Center(child: Image.asset('images/logo.png')),

              const SizedBox(height: 21,),

              Center(child: SizedBox(width: 250,  child: textWidget(text: 'Sign up now to regain control of the internet from clutter and annoyances ads.', fontWeight: FontWeight.w400, fontSize: 14, color: AdProofColors.A140033.withOpacity(0.6), textAlign: TextAlign.center))),

              SizedBox(height: MediaQuery.of(context).size.height * 0.4,),


              CustomOutlineButton(text: 'Sign up with Email', icon: 'email', callback: () => context.push(AdProofRoutes.signUpWithEmail), ),

              const SizedBox(height: 14,),

              CustomOutlineButton(text: 'Sign up with Apple', icon: 'apple.svg',),

              const SizedBox(height: 14,),

              CustomOutlineButton(text: 'Sign up with Google', icon: 'google.svg',),


              const SizedBox(height: 28,),


              RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 12.0),
                    ),

                    TextSpan(
                      text: 'Sign in',
                      style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 12.0),
                    )
                  ]
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
