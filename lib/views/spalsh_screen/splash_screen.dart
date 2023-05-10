import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../onboarding/onboarding_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          AnimatedSplashScreen(
              duration: 3000,
              splash: 'images/logo.png',
              nextScreen: const OnBoardingPage(),
              splashIconSize: 120.0,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.white),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Align(alignment: Alignment.bottomCenter, child: RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Designed by ',
                  style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 12.0),
                ),

                TextSpan(
                  text: 'Peddle Technologies',
                  style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 12.0),
                )
              ]
            ),),),
          )
        ],
      ),
    );
  }
}
