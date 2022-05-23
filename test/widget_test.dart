import 'dart:convert';

import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger();

void main() async {
  Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");

  var result = await http.get(url);

  List data = (json.decode(result.body) as Map<String, dynamic>)["data"];

  logger.d("result.body => ${result.body}");
  logger.d("data => $data");

  // logger.d(result.body);

  //data dari api -> model (yang sudah disiapkan)
  Surah surahAnnaas = Surah.fromJson(data[113]);
  logger.d(surahAnnaas.toJson());

  //COBA MASUK KE NESTED MODEL
  logger.d(surahAnnaas.name!.long);

  Uri urlAnnas =
      Uri.parse("https://api.quran.sutanlab.id/surah/${surahAnnaas.number}");

  var resultAnnas = await http.get(urlAnnas);

  logger.d("result annas => ${resultAnnas.body}");

  var dataAnnaas =
      (json.decode(resultAnnas.body) as Map<String, dynamic>)["data"];

  logger.d("data annas => $dataAnnaas");

  DetailSurah detailAnnaas = DetailSurah.fromJson(dataAnnaas);
  logger.d("object annas => ${detailAnnaas.toJson()}");
  logger.d("ayat annas => ${detailAnnaas.verses![0].text!.arab}");
}
