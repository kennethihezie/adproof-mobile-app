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

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  bool isWrongPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 24.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            onTap: () => context.pop(),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(12)),

                              //Am using defaultTargetPlatform to determine the device and display the native icon
                              child: Icon(
                                  defaultTargetPlatform == TargetPlatform.iOS
                                      ? Icons.arrow_back_ios
                                      : Icons.arrow_back),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      SizedBox(
                          width: 200,
                          child: textWidget(
                              text: 'Seems you lost your key 😭',
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: AdProofColors.A140033)),
                      const SizedBox(
                        height: 21,
                      ),
                      SizedBox(
                        width: 250,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  'Enter your email address to receive a password reset link. ',
                              style: GoogleFonts.dmSans(
                                  color: AdProofColors.A140033.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Column(
                        children: [
                          LabelledInput(
                            controller: _emailController,
                            label: 'Email',
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            hint: 'Enter email',
                            isWrongPassword: isWrongPassword,
                            errorMsg: 'Email dosen\'t exist!',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomButton(
                            title: 'Send code',
                            callback: () => {
                              if(_emailController.text.isNotEmpty && Helper.emailRegex(_emailController.text)){
                                context.push(AdProofRoutes.newPassword)
                              } else {
                                setState((){
                                  isWrongPassword = true;
                                })
                              }
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Have a problem?  ',
                                style: GoogleFonts.dmSans(
                                    color:
                                        AdProofColors.A140033.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              ),
                              TextSpan(
                                text: 'Contact us',
                                style: GoogleFonts.dmSans(
                                    color: AdProofColors.A140033,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              )
                            ]),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
