import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:masjid_pakisaji_mobile/const/app_color.dart';
import 'package:masjid_pakisaji_mobile/const/app_string.dart';
import 'package:masjid_pakisaji_mobile/models/masjid/masjid_model.dart';

class MasjidDetailCarouselWidget extends StatelessWidget {
  final MasjidModel? dataModel;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final int currentIndex;
  const MasjidDetailCarouselWidget({
    super.key,
    required this.dataModel,
    required this.onPageChanged,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images =
        dataModel!.image!.isNotEmpty ? dataModel!.image! : [masjidImage];
        
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: onPageChanged,
            aspectRatio: 16 / 9,
            autoPlay: images.length > 1,
            scrollPhysics:
                images.length > 1
                    ? BouncingScrollPhysics()
                    : NeverScrollableScrollPhysics(),
          ),
          items:
              images.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(item, fit: BoxFit.cover),
                );
              }).toList(),
        ),

        SizedBox(height: 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              images.asMap().entries.map((entry) {
                return Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        currentIndex == entry.key
                            ? selectedColor
                            : unselectedColor,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
