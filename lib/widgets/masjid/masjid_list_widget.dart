import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_size.dart';
import 'package:masjid_pakisaji_mobile/const/app_string.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';
import 'package:masjid_pakisaji_mobile/models/masjid/masjid_model.dart';
import 'package:masjid_pakisaji_mobile/screens/masjid_detail/masjid_detail_screen.dart';
import 'package:masjid_pakisaji_mobile/utils/format_distancte.dart';

class MasjidListWidget extends StatelessWidget {
  final List<MasjidModel>? dataModel;
  final double? userLat;
  final double? userLon;

  const MasjidListWidget({
    super.key,
    required this.dataModel,
    required this.userLat,
    required this.userLon,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: dataModel!.length,
      itemBuilder: (context, index) {
        final data = dataModel![index];

        final distance = Geolocator.distanceBetween(
          userLat!,
          userLon!,
          data.latitude,
          data.longitude,
        );

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MasjidDetailScreen(id: data.id),
              ),
            );
          },

          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: blackColor.withAlpha(100),
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Image.asset(
                    data.image!.isNotEmpty ? data.image![0] : masjidImage,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: mediaWidth(context: context),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data.nama,
                            style: mediumHeading(
                              color: whiteColor,
                              weight: medium(),
                            ),
                          ),

                          SizedBox(height: 2),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  data.alamat,
                                  style: mediumCaption(
                                    color: whiteColor,
                                    weight: regular(),
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(icLocation, width: 15),

                                        SizedBox(width: 2),

                                        Text(
                                          formatDistance(distance),
                                          style: mediumCaption(
                                            color: whiteColor,
                                            weight: medium(),
                                          ),
                                          maxLines: 1,
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
