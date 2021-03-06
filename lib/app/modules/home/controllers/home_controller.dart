import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/surah.dart';
import '../../../utils/logger.dart';

class HomeController extends GetxController {
  Future<List<Surah>> getAllSurah() async {
    logger.d("FETCHING data");
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
    var result = await http.get(url);
    List? data = (json.decode(result.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
  
  
}
