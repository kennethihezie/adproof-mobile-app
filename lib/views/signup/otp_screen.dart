import 'package:adproof/app/routes.dart';
import 'package:adproof/utils/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import '../../utils/text_widget.dart';
import '../../utils/timmer_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

/// Created by collins ihezie on 10/05/23

class OtpPage extends StatefulWidget {
  final String? email;
  const OtpPage({Key? key, this.email}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final pinController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 24.0),
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

                  SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                  textWidget(text: 'OTP Verification', fontWeight: FontWeight.w700, fontSize: 30, color: AdProofColors.A140033),

                  const SizedBox(height: 21,),

                  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'We sent a verification code to your email address ',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 12.0),
                        ),

                        TextSpan(
                          text: widget.email ?? '',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 12.0),
                        )
                      ]
                  ),),

                  const SizedBox(height: 24,),

                  TimerWidget(count: 30),

                  const SizedBox(height: 32,),

                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: Center(
                        child: OTPTextField(
                          controller: pinController,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 60,
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.w400, fontSize: 40.0),

                          fieldStyle: FieldStyle.box,
                          otpFieldStyle: OtpFieldStyle(
                            backgroundColor: AdProofColors.AF1F6FB,
                            enabledBorderColor: AdProofColors.AF1F6FB,
                            disabledBorderColor: AdProofColors.AF1F6FB,
                            focusBorderColor: AdProofColors.A140033.withOpacity(0.7)
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          onCompleted: (smsCode) {
                          },
                        )),
                  ),

                  const SizedBox(height: 32,),

                  CustomButton(title: 'Proceed', callback: () => context.push(AdProofRoutes.privacyPage),),

                  const SizedBox(height: 24,),

                  Center(child:   RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Didn\'t receive OTP?   ',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14.0),
                        ),

                        TextSpan(
                          text: 'Resend code',
                          style: GoogleFonts.dmSans(color: AdProofColors.AFD22D4, fontWeight: FontWeight.bold, fontSize: 14.0),
                        )
                      ]
                  ),),),

                  const SizedBox(height: 24,),

                  Center(child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have a problem?  ',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 12.0),
                        ),

                        TextSpan(
                          text: 'Contact us',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 12.0),
                        )
                      ]
                  ),),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
