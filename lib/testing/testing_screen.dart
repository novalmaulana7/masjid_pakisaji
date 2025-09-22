import 'package:flutter/material.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';
import 'package:masjid_pakisaji_mobile/screens/splash/splash_screen.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: blackColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SplashScreen()),
          );
        },
        child: Text(
          "Button Test",
          style: mediumBody(color: whiteColor, weight: medium()),
        ),
      ),
    );
  }
}
