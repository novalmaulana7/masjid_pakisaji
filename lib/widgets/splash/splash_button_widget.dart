import 'package:flutter/material.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_size.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';
import 'package:masjid_pakisaji_mobile/screens/masjid/masjid_screen.dart';

class SplashButtonWidget extends StatelessWidget {
  const SplashButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaWidth(context: context),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MasjidScreen(
              
            )),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          elevation: 0,
          alignment: Alignment.center,
        ),
        child: Text(
          "Berikutnya",
          style: semiboldHeading(color: whiteColor, weight: semibold()),
        ),
      ),
    );
  }
}
