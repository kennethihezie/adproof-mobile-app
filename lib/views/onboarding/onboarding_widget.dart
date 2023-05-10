import 'package:adproof/utils/colors.dart';
import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Created by collins ihezie on 10/05/23

class OnBoardingWidget extends StatelessWidget {
  final String title, image, subTitle;
  const OnBoardingWidget({Key? key, required this.title, required this.image, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 250,  child: textWidget(text: title, fontSize: 30, fontWeight: FontWeight.w500, textAlign: TextAlign.center, color: AdProofColors.A140033)),

        SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

        SvgPicture.asset('images/$image'),

        SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

        SizedBox(width: 200,  child: textWidget(text: subTitle, fontSize: 14, fontWeight: FontWeight.w400, textAlign: TextAlign.center, color: AdProofColors.A140033.withOpacity(0.6))),
      ],
    );
  }
}
