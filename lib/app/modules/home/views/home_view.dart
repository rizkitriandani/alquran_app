import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../data/models/surah.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/logger.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Digital'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Quran Digital",
            //     style: textTheme.headline1!.copyWith(fontSize: 24)),

            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 112,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [accentGradient, primary, primary])),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/ic_quran.png', /* width:55,height:55 */
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sudah Baca Al-Qur'an?",
                            style: basedFont.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: white)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Terakhir dibaca",
                            style: basedFont.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: white)),
                        Text("Tidak ada data",
                            style: basedFont.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: white)),
                      ],
                    ),
                    Image.asset('assets/images/ic_arrow_right.png',
                        width: 14, height: 14),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: FutureBuilder<List<Surah>>(
                  future: controller.getAllSurah(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData) {
                      return const Center(child: Text("Gagal memuat data"));
                    }

                    logger.d(snapshot);

                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Surah surah = snapshot.data![index];
                          return ListTile(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_SURAH,
                                  arguments: surah);
                            },
                            leading: Container(
                              height: 42,
                              width: 42,
                              // constraints: const BoxConstraints.expand(),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/decoration.png'),
                                      fit: BoxFit.cover)),
                              child: Center(child: Text("${surah.number}")),
                            ),
                            title: Text(surah.name!.transliteration!.id!),
                            subtitle: Text(
                                "${surah.numberOfVerses!} Ayat | ${surah.revelation!.id!}"),
                            trailing: Text(surah.name!.short!),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
