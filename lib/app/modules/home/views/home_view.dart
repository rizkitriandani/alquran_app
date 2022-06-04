import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/logger.dart';
import '../../../widgets/nav_drawer.dart';
import '../controllers/home_controller.dart';
import 'list_surah_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Quran Digital'),
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.SEARCH),
                icon: const Icon(Icons.search,))
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Quran Digital",
              //     style: textTheme.headline1!.copyWith(fontSize: 24)),
    
              const SizedBox(
                height: 30,
              ),
    
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
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
                    onTap: () => logger.d("Tap last read"),
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 112,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
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
                  ),
                ),
              ),
    
              const SizedBox(
                height: 30,
              ),
    
              const TabBar(tabs: [
                Tab(
                  text: "Surah",
                ),
                Tab(
                  text: "Juz",
                ),
                Tab(
                  text: "Bookmark",
                ),
              ]),
    
              Expanded(
                child: TabBarView(children: [
                  ListSurah(controller: controller),
                  ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                      
                      },
                      leading: Container(
                        height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage('assets/images/decoration.png'),
                                fit: BoxFit.cover)),
                        child: Center(child: Text("${index+1}")),
                      ),
                      title: Text("Juz ${index+1}"),
                    );
                  }),
                  const Center(child: Text("Bookmark View")),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
