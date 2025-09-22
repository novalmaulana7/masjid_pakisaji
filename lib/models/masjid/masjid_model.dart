class MasjidModel {
  final String id;
  final List<String>? image;
  final String nama;
  final String alamat;
  final int luasTanah;
  final int luasBangunan;
  final String statusTanah;
  final int dayaTampung;
  final int tahunBerdiri;
  final double latitude;
  final double longitude;
  final String sumber;

  MasjidModel({
    required this.id,
    required this.image,
    required this.nama,
    required this.alamat,
    required this.luasTanah,
    required this.luasBangunan,
    required this.statusTanah,
    required this.dayaTampung,
    required this.tahunBerdiri,
    required this.latitude,
    required this.longitude,
    required this.sumber,
  });

  // Convert JSON -> Object
  factory MasjidModel.fromJson(Map<String, dynamic> json) {
    return MasjidModel(
      id: json['id'],
      image:
          json['image'] != null
              ? List<String>.from(
                json['image'],
<<<<<<< HEAD
              ) // 🔑 Konversi dari List<dynamic>
=======
              ) // 🔑 Konversi dari List<String>
>>>>>>> 6fa1b7b (Initial Commit)
              : [],
      nama: json['nama'],
      alamat: json['alamat'],
      luasTanah: json['luas_tanah_m2'],
      luasBangunan: json['luas_bangunan_m2'],
      statusTanah: json['status_tanah'],
      dayaTampung: json['daya_tampung'],
      tahunBerdiri: json['tahun_berdiri'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      sumber: json['sumber'],
    );
  }
}
