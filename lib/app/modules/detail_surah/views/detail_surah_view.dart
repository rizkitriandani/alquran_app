import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../data/models/detail_surah.dart' as detail;
import '../../../data/models/surah.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/logger.dart';

import '../../../widgets/tafsir_surah_dialog.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Surah surah = Get.arguments;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [accentGradient, primary, primary])),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () => Get.dialog(
                      SurahTafsirView(surah: surah),
                      useSafeArea: true,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
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
                    ),
                  ),
                ),
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
                  if (snapshot.data == null) {
                    logger.d("=== Snapshot => $snapshot");
                    return const Center(child: Text("Tidak ada data"));
                  }

                  logger.d("=== Snapshot => $snapshot");
                  logger.d("=== Snapsho.hasDara => ${snapshot.hasData}");

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.verses!.length ?? 0,
                    itemBuilder: (context, index) {
                      detail.Verse? ayat = snapshot.data?.verses![index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            color: primary,
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
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            child: InkWell(
                              onTap: () => Get.toNamed(
                                Routes.TAFSIR,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
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
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic),
                                    textAlign: TextAlign.end,
                                  ),
                                  const SizedBox(height: 25),
                                  Text(
                                    ayat.translation!.id!,
                                    style: const TextStyle(fontSize: 18),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
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
