import 'package:adproof/utils/colors.dart';
import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  String? icon;
  Color? color;
  Function? callback;
  CustomOutlineButton({Key? key, required this.text, this.icon, this.callback, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback?.call(),

      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AdProofColors.A140033.withOpacity(0.2))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            icon != 'email' ? SvgPicture.asset('images/$icon') : Container(
              width: 29,
              height: 29,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: color ?? AdProofColors.A140033,
                borderRadius: BorderRadius.circular(14.5)
              ),
              child: Center(
                child: SvgPicture.asset('images/email.svg'),
              ),
            ),

            textWidget(text: text, fontSize: 14, fontWeight: FontWeight.w500, color: AdProofColors.A140033),

            const SizedBox()
          ],
        ),
      ),
    );
  }
}
