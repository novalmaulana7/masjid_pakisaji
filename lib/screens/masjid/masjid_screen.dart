import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/utils/pattern_background.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';
import 'package:masjid_pakisaji_mobile/models/masjid/masjid_model.dart';
import 'package:masjid_pakisaji_mobile/services/location_service.dart';
import 'package:masjid_pakisaji_mobile/services/masjid_service.dart';
import 'package:masjid_pakisaji_mobile/widgets/masjid/masjid_list_widget.dart';

class MasjidScreen extends StatefulWidget {
  const MasjidScreen({super.key});

  @override
  State<MasjidScreen> createState() => _MasjidScreenState();
}

class _MasjidScreenState extends State<MasjidScreen> {
  late Future<List<MasjidModel>> futureMasjid;
  double? userLat;
  double? userLon;
  StreamSubscription<Position>? positionSubscription;

  @override
  void initState() {
    super.initState();
    futureMasjid = MasjidService().getAllMasjid();
    _getUserLocation();
  }

  @override
  void dispose() {
    positionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Masjid",
          style: semiboldHeading(color: blackColor, weight: semibold()),
        ),
      ),
      body: Stack(
        children: [
          patternBackground(),

          FutureBuilder<List<MasjidModel>>(
            future: futureMasjid,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: mediumBody(color: blackColor, weight: medium()),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "Data kosong",
                    style: boldDisplay(color: blackColor, weight: bold()),
                  ),
                );
              } else {
                if (userLat == null || userLon == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                final masjid = snapshot.data;
                return MasjidListWidget(
                  dataModel: masjid,
                  userLat: userLat!,
                  userLon: userLon!,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _getUserLocation() async {
    try {
      Stream<Position> positionStream = await LocationService.getUserLocation();

      positionSubscription = positionStream.listen((Position position) {
        setState(() {
          userLat = position.latitude;
          userLon = position.longitude;
        });
      });
    } catch (e) {
      log("Error ambil lokasi: $e");
    }
  }
}
