import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:adproof/utils/text_widget.dart';
import 'package:flutter/cupertino.dart';

import 'colors.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget({Key? key, required this.count, this.intervalInSeconds, this.callBack}) : super(key: key);
  int count;
  final int? intervalInSeconds;
  Function? callBack;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;

  void startTimer() {
    final oneSec = Duration(seconds: widget.intervalInSeconds ?? 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (widget.count == 0) {
          setState(() {
            timer.cancel();
            widget.callBack?.call();
          });
        } else {
          setState(() {
            widget.count--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        children: [
          TextSpan(
            text: 'Expires in 30 seconds ',
            style: GoogleFonts.dmSans(color: AdProofColors.A140033.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14.0),
          ),

          TextSpan(
            text: intToTimeLeft(widget.count),
            style: GoogleFonts.dmSans(color: AdProofColors.AFD22D4, fontWeight: FontWeight.w500, fontSize: 14.0),
          )
        ]
    ),);
  }

  String intToTimeLeft(int value) {
    int h, m, s;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (h * 3600) - (m * 60);

    return "$h:$m:$s";
  }
}