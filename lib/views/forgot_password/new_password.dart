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

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;


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
                              text: 'Set new Password',
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
                                  'Your new password must be different to previously used passwords. ',
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
                              controller: _newPasswordController,
                              label: 'New password',
                              inputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              hint: 'new password',
                              isPassword: true,
                            obscureText: obscureNewPassword,
                            toggleObscureText: (){
                                setState(() {
                                  obscureNewPassword = !obscureNewPassword;
                                });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: textWidget(
                                text: 'Must be at least 8 characters.',
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 31,
                          ),
                          LabelledInput(
                              controller: _confirmPasswordController,
                              label: 'Confirm New Password',
                              inputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              hint: 'confirm new password',
                              obscureText: obscureConfirmPassword,
                              isPassword: true,
                              toggleObscureText: () {
                                setState(() {
                                  obscureConfirmPassword = !obscureConfirmPassword;
                                });
                              },
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          CustomButton(
                            title: 'Reset Password',
                            callback: () => context.push(AdProofRoutes.passwordSuccessPage),
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
