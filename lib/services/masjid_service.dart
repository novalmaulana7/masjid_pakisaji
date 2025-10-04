import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:masjid_pakisaji_mobile/models/masjid/masjid_model.dart';

class MasjidService {
  Future<List<MasjidModel>> getAllMasjid() async {
    // Baca file JSON
    String response = await rootBundle.loadString('assets/json/data.json');

    // Decode JSON
    List<dynamic>? data = jsonDecode(response);

    // Convert to List
    return data!.map((e) => MasjidModel.fromJson(e)).toList();
  }

  // Function get masjid by id
  Future<MasjidModel?> getMasjidById(String id) async {
    final masjidList = await getAllMasjid();
    try {
      return masjidList.firstWhere((masjid) => masjid.id == id);
    } catch (e) {
      return null;
    }
  }
}
