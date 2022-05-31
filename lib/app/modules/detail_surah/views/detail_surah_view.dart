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

      // appBar: AppBar(
      //   title: Text(surah.name!.transliteration!.id!.toUpperCase()),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Text(
                    surah.name!.transliteration!.id!.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "[ ${surah.name!.translation!.id} ]",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${surah.numberOfVerses} Ayat | ${surah.revelation!.id}",
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
                future: controller.getDetailSurah(surah.number!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData) {
                    logger.d("=== Snapshot => $snapshot");
                    return const Center(child: Text("Tidak ada data"));
                  }

                  logger.d("=== Snapshot => $snapshot");

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.verses!.length ?? 0,
                    itemBuilder: (context, index) {
                      // if (snapshot.data?.verses.isEmpty) {
                      //   return const SizedBox();
                      // }
                      detail.Verse? ayat = snapshot.data?.verses![index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                ayat!.text!.arab!,
                                style: const TextStyle(fontSize: 30),
                                textAlign: TextAlign.end,
                              )),
                          const SizedBox(height: 10),
                          Text(
                            ayat.text!.transliteration!.en!,
                            style: const TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(height: 25),
                          Text(
                            ayat.translation!.id!,
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
