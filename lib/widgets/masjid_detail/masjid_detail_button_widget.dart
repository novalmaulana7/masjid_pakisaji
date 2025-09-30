import 'package:flutter/material.dart';
import 'package:masjid_pakisaji_mobile/utils/url_launcher.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_size.dart';
import 'package:masjid_pakisaji_mobile/const/app_string.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';

class MasjidDetailButtonWidget extends StatelessWidget {
  final String? urlString;
  const MasjidDetailButtonWidget({super.key, required this.urlString});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaWidth(context: context),
      child: ElevatedButton(
        onPressed: () {
          urlLauncher(urlString!);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          alignment: Alignment.center,
          backgroundColor: whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: BorderSide(color: greyColor, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sumber informasi dari  ",
              style: mediumBody(color: blackColor, weight: medium()),
            ),

            Image.asset(simasImage, width: 42),
          ],
        ),
      ),
    );
  }
}
