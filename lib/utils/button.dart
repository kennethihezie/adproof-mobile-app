import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

/// Created by collins ihezie on 10/05/23

class CustomButton extends StatelessWidget {
  final String title;
  Function? callback;
  CustomButton({Key? key, required this.title, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback?.call(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AdProofColors.AFFB027,
          borderRadius: BorderRadius.circular(28),
        ),

        child: Center(child: textWidget(text: title, fontSize: 14, fontWeight: FontWeight.w500, textAlign: TextAlign.center),),
      ),
    );
  }
}
