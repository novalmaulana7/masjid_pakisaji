import 'package:flutter/material.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';

class MasjidDetailRowWidget extends StatelessWidget {
  final String? label;
  final String? value;
  const MasjidDetailRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label!,
            style: regularCaption(color: blackColor, weight: regular()),
          ),
        ),

        Text(
          ":   ",
          style: regularCaption(color: blackColor, weight: regular()),
        ),

        Expanded(
          flex: 2,
          child: Text(
            value!,
            style: regularCaption(color: blackColor, weight: regular()),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
