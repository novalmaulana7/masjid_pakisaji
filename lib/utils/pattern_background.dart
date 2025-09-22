import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';

Widget patternBackground() {
  return Stack(
    children: [
      Align(
        alignment: Alignment(2.2, -1.2),
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: patternColor,
            shape: BoxShape.circle,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
            child: Container(),
          ),
        ),
      ),
      Align(
        alignment: Alignment(-2.5, 1),
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: patternColor,
            shape: BoxShape.circle,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
            child: Container(),
          ),
        ),
      ),
    ],
  );
}
