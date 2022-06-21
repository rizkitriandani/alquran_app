import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constants/constants.dart';
import '../../../data/models/juz.dart';
import '../../../data/models/surah.dart';
import '../../../utils/logger.dart';

class HomeController extends GetxController {

  @override
  onInit() async {
    await loadAsset();
    super.onInit();
  }

  List<String> juzSubtitle = [];

  Future<void> loadAsset() async {
    String loadedString = await rootBundle.loadString('assets/juz.txt');
    juzSubtitle = loadedString.split('\n');
  }

  Future<List<Surah>> getAllSurah() async {
    logger.d("FETCHING data");
    Uri url = Uri.parse("$API_HOST/surah/");
    var result = await http.get(url);
    List? data = (json.decode(result.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];

    for (int i = 1; i <= 30; i++) {
      logger.d("FETCHING data juz ke-$i");
      Uri url = Uri.parse("$API_HOST/juz/$i");
      var result = await http.get(url);

      Map<String, dynamic> data =
          (json.decode(result.body) as Map<String, dynamic>)["data"];
      Juz juz = Juz.fromJson(data);
      allJuz.add(juz);
    }

    return allJuz;
  }
}
