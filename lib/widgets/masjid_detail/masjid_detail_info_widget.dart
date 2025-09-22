import 'package:flutter/material.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_size.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';
import 'package:masjid_pakisaji_mobile/models/masjid/masjid_model.dart';
import 'package:masjid_pakisaji_mobile/widgets/masjid_detail/masjid_detail_row_widget.dart';

class MasjidDetailInfoWidget extends StatelessWidget {
  final MasjidModel? dataModel;
  const MasjidDetailInfoWidget({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaWidth(context: context),
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: blackColor.withAlpha(50),
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Info Masjid",
            style: mediumHeading(color: blackColor, weight: medium()),
          ),

          Divider(color: greyColor),

          // Nomor ID SIMAS
          MasjidDetailRowWidget(
            label: "Nomor ID SIMAS",
            value: dataModel!.id.toString(),
          ),

          SizedBox(height: 4),

          // Alamat Masjid
          MasjidDetailRowWidget(
            label: "Alamat Masjid",
            value: dataModel!.alamat,
          ),

          // Luas Tanah
          MasjidDetailRowWidget(
            label: "Luas Tanah",
            value: "${dataModel!.luasTanah.toString()} m²",
          ),

          SizedBox(height: 4),

          // Luas Bangunan
          MasjidDetailRowWidget(
            label: "Luas Bangunan",
            value: "${dataModel!.luasBangunan.toString()} m²",
          ),

          SizedBox(height: 4),

          // Daya Tampung
          MasjidDetailRowWidget(
            label: "Daya Tampung",
            value: "${dataModel!.luasTanah.toString()} Jamaah",
          ),

          SizedBox(height: 4),

          // Status Tanah
          MasjidDetailRowWidget(
            label: "Status Tanah",
            value: "Tanah ${dataModel!.statusTanah}",
          ),

          SizedBox(height: 4),

          // Tahun Berdiri
          MasjidDetailRowWidget(
            label: "Tahun Berdiri",
            value: dataModel!.tahunBerdiri.toString(),
          ),
        ],
      ),
    );
  }
}
