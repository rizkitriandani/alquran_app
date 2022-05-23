import 'dart:convert';

import 'package:alquran/app/data/models/ayat.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger();

void main() async {
  Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/108/1");

  var result = await http.get(url);

  //decode semua data di response.body ke dalam mapping
  Map<String, dynamic> data = json.decode(result.body)["data"];

  //Bikin satu mapping lagi yang hanya berisikan keyword:value yang dibutuhkan oleh model, dalam hal ini, model tidak memerlukan surah

  Map<String, dynamic> dataToModel = {
    "number": data["number"],
    "meta": data["meta"],
    "text": data["text"],
    "translation": data["translation"],
    "audio": data["audio"],
    "tafsir": data["tafsir"],
  };

  logger.d("dataToModel => $dataToModel");
  // Ayat ayat = Ayat.fromJson(dataToModel);

  //atau bisa langsung saja, ga usah buat variable mapping baru lagi karena di  modelnya udah otomatis diset apa aja yang mau diambil
  Ayat ayat = Ayat.fromJson(data);

  logger.d("Ayat => ${ayat.tafsir?.id?.short}");
}
