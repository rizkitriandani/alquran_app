import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/surah.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/logger.dart';
import '../controllers/home_controller.dart';

class ListSurah extends StatelessWidget {
  const ListSurah({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
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
                    Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
                  },
                  leading: Container(
                    height: 42,
                    width: 42,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('assets/images/decoration.png'),
                            fit: BoxFit.cover)),
                    child: Center(child: Text("${surah.number}")),
                  ),
                  title: Text(surah.name!.transliteration!.id!),
                  subtitle: Text(
                      "${surah.numberOfVerses!} Ayat | ${surah.revelation!.id!}"),
                  trailing: Text(surah.name!.short!),
                );
              });
        });
  }
}
