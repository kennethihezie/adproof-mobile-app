import 'package:adproof/utils/colors.dart';
import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Created by collins ihezie on 10/05/23

class LabelledInput extends StatelessWidget {
  String? label;
  TextEditingController controller;
  TextInputAction? inputAction;
  TextInputType? textInputType;
  bool obscureText;
  String? hint;
  Function? toggleObscureText;
  Function(String)? onChange;
  bool isError;
  String? errorMsg;
  bool isPassword;
  LabelledInput({Key? key, this.label, required this.controller, this.inputAction, this.textInputType, this.obscureText = false, this.toggleObscureText, this.hint, this.isError = false, this.errorMsg, this.isPassword = false, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(text: label!, fontWeight: FontWeight.w500, fontSize: 14, color: AdProofColors.A140033.withOpacity(0.6)),

              if(isError)
                textWidget(text: errorMsg ?? '', fontWeight: FontWeight.w500, fontSize: 14, color: AdProofColors.AF27E81),

            ],
          ),

        const SizedBox(height: 7,),

        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: AdProofColors.AF1F6FB,
            borderRadius: BorderRadius.circular(9),
            border: isError ? Border.all(color: AdProofColors.AF27E81) : null
          ),
          child: TextFormField(
            controller: controller,
            textInputAction: inputAction,
            keyboardType: textInputType,
            obscureText: obscureText,
            obscuringCharacter: '*',
            style: GoogleFonts.dmSans(color: AdProofColors.A140033, fontWeight: FontWeight.w500, fontSize: 14.0),
            onChanged: onChange,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              suffixIcon: isPassword ? InkWell(
                onTap: () => toggleObscureText?.call(),
                child: Icon(obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              ) : null
            ),
          ),
        )
      ],
    );
  }
}
