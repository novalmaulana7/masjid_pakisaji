import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:masjid_pakisaji_mobile/utils/url_launcher.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_string.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';

class MasjidDetailMapsWidget extends StatelessWidget {
  final MapController? mapController;
  final double? latitudeMasjid;
  final double? longitudeMasjid;

  const MasjidDetailMapsWidget({
    super.key,
    required this.mapController,
    required this.latitudeMasjid,
    required this.longitudeMasjid,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng initialCenter = LatLng(latitudeMasjid!, longitudeMasjid!);
    final double initialZoom = 17;
    final String mapsURL =
        "https://www.google.com/maps/search/?api=1&query=$latitudeMasjid,$longitudeMasjid";

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: greyColor, width: 1),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: initialCenter,
                  initialZoom: initialZoom,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: initialCenter,
                        width: initialZoom,
                        height: 50,
                        child: Icon(
                          Icons.location_on_sharp,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              left: 10,
              bottom: 10,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: InkWell(
                  onTap: () {
                    urlLauncher(mapsURL);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: greyColor, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withAlpha(50),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(icMaps, width: 22),

                        SizedBox(width: 2),

                        Text(
                          "Buka di Google Maps",
                          style: mediumCaption(
                            color: blackColor,
                            weight: medium(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              right: 10,
              bottom: 10,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: InkWell(
                  onTap: () {
                    mapController!.move(initialCenter, initialZoom);
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: greyColor, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withAlpha(50),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Icon(Icons.refresh_rounded, size: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
