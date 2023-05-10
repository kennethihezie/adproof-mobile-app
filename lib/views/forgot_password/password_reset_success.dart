import 'package:adproof/utils/button.dart';
import 'package:adproof/views/onboarding/onboarding_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/colors.dart';
import '../../utils/text_widget.dart';

class PasswordResetSuccess extends StatelessWidget {
  const PasswordResetSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children:  [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 250,  child: textWidget(text: 'Password Reset Successful', fontSize: 30, fontWeight: FontWeight.w500, textAlign: TextAlign.center, color: AdProofColors.A140033)),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                SvgPicture.asset('images/success.svg', width: 160,),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                SizedBox(width: 250,  child: textWidget(text: 'Welcome back to an Ad-Free Experience with Adproof', fontSize: 14, fontWeight: FontWeight.w400, textAlign: TextAlign.center, color: AdProofColors.A140033.withOpacity(0.6))),
              ],
            ),

            const SizedBox(height: 34,),

            CustomButton(title: 'Continue')
          ],
        ),
      )),
    );
  }
}
