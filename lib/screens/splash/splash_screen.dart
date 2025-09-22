import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/utils/pattern_background.dart';
import 'package:masjid_pakisaji_mobile/const/app_string.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';
import 'package:masjid_pakisaji_mobile/services/location_service.dart';
import 'package:masjid_pakisaji_mobile/widgets/splash/splash_button_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          patternBackground(),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(splashImage, fit: BoxFit.contain),
                ),

                SizedBox(height: 30),

                Text(
                  "Masjid",
                  style: boldDisplay(color: blackColor, weight: bold()),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Menyediakan Tampilan Berbagai Masjid di Daerah Pakisaji, Malang",
                    style: mediumBody(color: greyColor, weight: medium()),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: SplashButtonWidget(),
          ),
        ],
      ),
    );
  }

  Future<void> initApp() async {
    try {
      // cek & minta izin lokasi saat app start
      Position position = await LocationService.getUserLocation();
      log("Lokasi User: ${position.latitude}, ${position.longitude}");
    } catch (e) {
      log("Error lokasi: $e");
    }
  }
}
