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

                  logger.d("=== Snapshot => $snapshot");
                  logger.d("=== Snapsho.hasData => ${snapshot.hasData}");

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      detail.Verse? detailVerse = snapshot.data?.verses![index];
                      logger.d("WIDTH => ${Get.width}");

                      return Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () => Get.bottomSheet(
                            Container(
                              height: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ListTile(
                                      onTap: () {},
                                      leading: Icon(Icons.play_arrow_rounded,
                                          color: Get.isDarkMode
                                              ? white
                                              : accentDark),
                                      title: Text("Putar Murotal",
                                          style: basedFont.copyWith(
                                              fontSize: 14))),
                                  ListTile(
                                      onTap: () {
                                        Get.back();
                                        Get.toNamed(Routes.TAFSIR);
                                      },
                                      leading: Icon(Icons.menu_book_rounded,
                                          color: Get.isDarkMode
                                              ? white
                                              : accentDark),
                                      title: Text("Lihat Tafsir",
                                          style: basedFont.copyWith(
                                              fontSize: 14))),
                                  ListTile(
                                      onTap: () {
                                        Get.snackbar("Bookmark ditambahkan",
                                            "menambah ayat ini ke dalam bookmark");
                                      },
                                      leading: Icon(Icons.bookmark_add_rounded,
                                          color: Get.isDarkMode
                                              ? white
                                              : accentDark),
                                      title: Text("Bookmark",
                                          style: basedFont.copyWith(
                                              fontSize: 14))),
                                ],
                              ),
                            ),
                            backgroundColor:
                                Get.isDarkMode ? accentDark : white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
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
                                      child: Text(
                                          "${detailVerse!.number!.inSurah}")),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                          child: Text(detailVerse.text!.arab!,
                                              style: basedFont.copyWith(
                                                  fontSize: 20),
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
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.numberOfVerses!,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: primary),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
