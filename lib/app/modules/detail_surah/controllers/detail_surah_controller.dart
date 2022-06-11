import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constants/constants.dart';
import '../../../data/models/detail_surah.dart';
import '../../../utils/logger.dart';

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailSurah(int id) async {
    logger.d("FETCHING data");
    Uri url = Uri.parse("$API_HOST/surah/$id");
    var result = await http.get(url);
    logger.d("RESULT => $result");
    
    Map<String, dynamic> data = (json.decode(result.body) as Map<String, dynamic>)["data"];

    logger.d("DATA => $data");
    
    return DetailSurah.fromJson(data);
    
  }
}
