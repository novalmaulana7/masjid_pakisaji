import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_string.dart';
import 'package:masjid_pakisaji_mobile/const/app_text_style.dart';
import 'package:masjid_pakisaji_mobile/models/masjid/masjid_model.dart';
import 'package:masjid_pakisaji_mobile/services/masjid_service.dart';
import 'package:masjid_pakisaji_mobile/widgets/masjid_detail/masjid_detail_button_widget.dart';
import 'package:masjid_pakisaji_mobile/widgets/masjid_detail/masjid_detail_carousel_widget.dart';
import 'package:masjid_pakisaji_mobile/widgets/masjid_detail/masjid_detail_info_widget.dart';
import 'package:masjid_pakisaji_mobile/widgets/masjid_detail/masjid_detail_maps_widget.dart';

class MasjidDetailScreen extends StatefulWidget {
  final String? id;
  const MasjidDetailScreen({super.key, required this.id});

  @override
  State<MasjidDetailScreen> createState() => _MasjidDetailScreenState();
}

class _MasjidDetailScreenState extends State<MasjidDetailScreen> {
  late Future<MasjidModel?> futureMasjid;
  int? _currentIndex;
  MapController? _mapController;

  @override
  void initState() {
    super.initState();
    futureMasjid = MasjidService().getMasjidById(widget.id!);
    _currentIndex = 0;
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MasjidModel?>(
      future: MasjidService().getMasjidById(widget.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError || !snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: Text(
                "Masjid Ada",
                style: boldDisplay(color: blackColor, weight: bold()),
              ),
            ),
          );
        } else {
          final masjidDetail = snapshot.data!;
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(icBack, width: 24),
              ),
              title: Text(
                masjidDetail.nama,
                style: semiboldHeading(color: blackColor, weight: semibold()),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MasjidDetailCarouselWidget(
                    currentIndex: _currentIndex!,
                    dataModel: masjidDetail,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),

                  SizedBox(height: 20),

                  MasjidDetailInfoWidget(dataModel: masjidDetail),

                  SizedBox(height: 20),

                  MasjidDetailMapsWidget(
                    mapController: _mapController,
                    latitudeMasjid: masjidDetail.latitude,
                    longitudeMasjid: masjidDetail.longitude,
                  ),

                  SizedBox(height: 40),

                  MasjidDetailButtonWidget(urlString: masjidDetail.sumber),

                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
