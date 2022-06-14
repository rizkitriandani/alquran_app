import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../data/models/detail_surah.dart' as detail;
import '../../../data/models/surah.dart';
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
                  // if (snapshot.data == null) {
                  //   logger.d("=== Snapshot => $snapshot");
                  //   return const Center(child: Text("Tidak ada data"));
                  // }

                  logger.d("=== Snapshot => $snapshot");
                  logger.d("=== Snapsho.hasData => ${snapshot.hasData}");

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.verses!.length ?? 0,
                    itemBuilder: (context, index) {
                      detail.Verse? detailVerse = snapshot.data?.verses![index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 42,
                              width: 42,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/decoration.png'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                  child:
                                      Text("${detailVerse!.number!.inSurah}")),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      child: Text(detailVerse.text!.arab!,
                                          style:
                                              basedFont.copyWith(fontSize: 20),
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      child: Text(
                                        "${detailVerse.text!.transliteration!.en}",
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      child: Text(
                                        "${detailVerse.translation!.id}",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
