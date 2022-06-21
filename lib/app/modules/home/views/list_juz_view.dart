
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../data/models/juz.dart' as juz;
import '../../../utils/logger.dart';
import '../controllers/home_controller.dart';

class ListJuz extends StatelessWidget {
  const ListJuz({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return 
    
     ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, index) {

        return Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical:10),
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
                            image: AssetImage('assets/images/decoration.png'),
                            fit: BoxFit.cover)),
                    child:
                        Center(child: Text("${index+1}")),
                  ),
                  SizedBox(width: 10,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: Text("Juz ${index+1}",
                                style: basedFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.start),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: Text(
                              controller.juzSubtitle[index],
                              textAlign: TextAlign.start,
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
      itemCount: 30,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(color: primary),
    );
                
        

        /* ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                controller.juzSubtitle.add(
                    "Mulai dari sampai ");
                return ListTile(
                  onTap: () {
                    print(controller.juzSubtitle);
                  },
                  leading: Container(
                    height: 42,
                    width: 42,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('assets/images/decoration.png'),
                            fit: BoxFit.cover)),
                    child: Center(child: Text("${index + 1}")),
                  ),
                  title: Column(
                    children: [
                      Text("Juz ${index + 1}"),
                      Text(
                          controller.juzSubtitle[index]),
                    ],
                  ),
                );
              }); */
        

    /* FutureBuilder<List<juz.Juz>>(
        future: controller.getAllJuz(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Gagal memuat data"));
          }

          logger.d(snapshot);

          return ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                controller.juzSubtitle.add(
                    "Mulai dari ${snapshot.data![index + 1].juzStartInfo} sampai ${snapshot.data![index + 1].juzEndInfo}");
                return ListTile(
                  onTap: () {
                    print(controller.juzSubtitle);
                  },
                  leading: Container(
                    height: 42,
                    width: 42,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('assets/images/decoration.png'),
                            fit: BoxFit.cover)),
                    child: Center(child: Text("${index + 1}")),
                  ),
                  title: Column(
                    children: [
                      Text("Juz ${index + 1}"),
                      Text(
                          "Mulai dari ${snapshot.data![index + 1].juzStartInfo} sampai ${snapshot.data![index + 1].juzEndInfo}"),
                    ],
                  ),
                );
              });
        }); */
  }
}
