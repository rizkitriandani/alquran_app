import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/tafsir_controller.dart';

class TafsirView extends GetView<TafsirController> {
  const TafsirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TafsirView'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Text(
          "Tidak ada tafsir",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
