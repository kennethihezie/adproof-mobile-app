import 'package:adproof/utils/button.dart';
import 'package:adproof/utils/colors.dart';
import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

/// Created by collins ihezie on 10/05/23

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 0.6],
            colors: [
              AdProofColors.AFD22D4,
              AdProofColors.AFFB027,
              Colors.white
            ],
          )
        ),

        child: ListView(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 0),
                      child: Align(alignment: Alignment.bottomLeft, child: InkWell(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(12)),

                          //Am using defaultTargetPlatform to determine the device and display the native icon
                          child: Icon(defaultTargetPlatform == TargetPlatform.iOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back, color: Colors.white,),
                        ),
                      ),),
                    ),

                    const SizedBox(height: 36,),

                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(text: 'Adproof Privacy policy', fontWeight: FontWeight.w700, fontSize: 20, color: AdProofColors.A1C3957),

                          const SizedBox(height: 15,),

                          textWidget(text: 'Lorem ipsum dolor sit amet consectetur. Nunc dolor elit .', fontSize: 14, fontWeight: FontWeight.w400, color: AdProofColors.A1C3957),

                          const SizedBox(height: 16,),

                          textWidget(text: 'What we need:', fontWeight: FontWeight.w500, fontSize: 14, color: AdProofColors.A1C3957),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: AdProofColors.AFFB027,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                              ),

                              const SizedBox(width: 9,),

                              textWidget(text: 'Lorem ipsum dolor sit amet conser. Nunc dolor elit .', fontWeight: FontWeight.w400, fontSize: 14, color: AdProofColors.A1C3957.withOpacity(0.6)),
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: AdProofColors.AFFB027,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                              ),

                              const SizedBox(width: 9,),

                              textWidget(text: 'Lorem ipsum dolor sit amet conser. Nunc dolor elit .', fontWeight: FontWeight.w400, fontSize: 14, color: AdProofColors.A1C3957.withOpacity(0.6)),
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: AdProofColors.AFFB027,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                              ),

                              const SizedBox(width: 9,),

                              textWidget(text: 'Lorem ipsum dolor sit amet conser. Nunc dolor elit .', fontWeight: FontWeight.w400, fontSize: 14, color: AdProofColors.A1C3957.withOpacity(0.6)),
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: AdProofColors.AFFB027,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                              ),

                              const SizedBox(width: 9,),

                              textWidget(text: 'Lorem ipsum dolor sit amet conser. Nunc dolor elit .', fontWeight: FontWeight.w400, fontSize: 14, color: AdProofColors.A1C3957.withOpacity(0.6)),
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                          RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Lorem ipsum dolor sit amet consectetur. Tincidunt sagittis urna sit egestas sollicitudin. Aliquam ',
                                  style: GoogleFonts.dmSans(color: AdProofColors.A1C3957.withOpacity(0.6), fontWeight: FontWeight.w400, fontSize: 14.0),
                                ),

                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: GoogleFonts.dmSans(color: AdProofColors.A1C3957, fontWeight: FontWeight.w500, fontSize: 14.0),
                                )
                              ]
                          ),),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                          CustomButton(title: 'Accept and continue'),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
