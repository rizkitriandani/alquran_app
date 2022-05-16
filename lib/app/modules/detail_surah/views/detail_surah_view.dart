import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/detail_surah.dart' as detail;
import '../../../data/models/surah.dart';
import '../../../utils/logger.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  @override
  Widget build(BuildContext context) {
    final Surah surah = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.name.transliteration.id.toUpperCase()),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  surah.name.transliteration.id.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "[ ${surah.name.translation.id} ]",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${surah.numberOfVerses} Ayat | ${surah.revelation.id}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<detail.DetailSurah>(
              future: controller.getDetailSurah(surah.number),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData) {
                  return const Center(child: Text("Tidak ada data"));
                }

                logger.v("Snapshot => $snapshot");

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.verses.length ?? 0,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Text("${index + 1}"),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.bookmark_add_outlined)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.play_arrow)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(snapshot.data!.verses[index].text.arab, style: TextStyle(fontSize: 20),textAlign: TextAlign.start,)),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
