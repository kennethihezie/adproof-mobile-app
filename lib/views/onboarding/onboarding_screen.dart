import 'package:adproof/app/routes.dart';
import 'package:adproof/utils/colors.dart';
import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/button.dart';
import 'onboarding_widget.dart';
import 'package:go_router/go_router.dart';

/// Created by collins ihezie on 10/05/23

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _controller = PageController();
  bool isLastPage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

            Expanded(child:
              PageView(
                controller: _controller,
                onPageChanged: _onPageViewChange,
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: OnBoardingWidget(
                      title: 'Block intrusive and annoying ads',
                      image: 'onboarding_image.svg',
                      subTitle: 'No more interruptions from unwanted ads',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: OnBoardingWidget(
                      title: 'Enhanced online privacy protection',
                      image: 'onboarding_image.svg',
                      subTitle: 'Keep your online activity safe and secure',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: OnBoardingWidget(
                      title: 'Block malware and phishing',
                      image: 'onboarding_image.svg',
                      subTitle: 'Stay protected from harmful software and phishing attempts',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: OnBoardingWidget(
                      title: 'Improve browsing performance',
                      image: 'onboarding_image.svg',
                      subTitle: 'Speed up your browsing experience and reduce page loading times',
                    ),
                  )
                ],
              )
            ),

            Padding(padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24), child: Column(
              children: [
                Center(
                  child: isLastPage ? InkWell(
                    onTap: () => context.push(AdProofRoutes.signUp),
                    child: textWidget(text: 'Continue', color: AdProofColors.AFD22D4, fontSize: 14, fontWeight: FontWeight.w700),
                  ) : SmoothPageIndicator(
                      controller: _controller, // PageController
                      count: 4,
                      effect: const ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 8,
                          activeDotColor: AdProofColors.AFD22D4), // your preferred effect
                      onDotClicked: (index) {}),
                ),

                const SizedBox(height: 33,),

                SizedBox(width: 220,  child: textWidget(text: 'The best adblocker app for a faster, safer browsing experience', fontWeight: FontWeight.w500, fontSize: 14, textAlign: TextAlign.center, color: AdProofColors.A140033.withOpacity(0.6))),

                const SizedBox(height: 22,),

                CustomButton(title: 'Register for free', callback: () => context.push(AdProofRoutes.signUp),),

                const SizedBox(height: 23,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => context.push(AdProofRoutes.login),
                      child: textWidget(text: 'Sign in', fontWeight: FontWeight.w500, fontSize: 14),
                    ),

                    const SizedBox(width: 15,),

                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AdProofColors.ACFD9E3,
                        borderRadius: BorderRadius.circular(3)
                      ),
                    ),

                    const SizedBox(width: 15,),

                    InkWell(
                      onTap: () => context.push(AdProofRoutes.signUp),
                      child: textWidget(text: 'Skip', fontWeight: FontWeight.w500, fontSize: 14),
                    )
                  ],
                ),

                const SizedBox(height: 22,),

                SizedBox(
                  width: 300,
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By starting a 7 days free trial. You accept the ',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 10.0),
                        ),

                        TextSpan(
                          text: 'Terms of Services ',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 10.0),
                        ),

                        TextSpan(
                          text: 'and the ',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 10.0),
                        ),

                        TextSpan(
                          text: 'Privacy Policy ',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.bold, fontSize: 10.0),
                        ),

                        TextSpan(
                          text: 'A monthly paid subscription will activate and you will be charged \$12.99 if you do not cancel your subscription at least 24 hours before the free trial period of 7 days comes to an end.',
                          style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 10.0),
                        ),
                      ]
                  ), textAlign: TextAlign.center,),
                )
              ],
            ),)
          ]),
        )
    );
  }

  _onPageViewChange(int page) {
    if(page == 3){
      setState(() {
        isLastPage = true;
      });
    } else {
      setState(() {
        isLastPage = false;
      });
    }
  }
}


