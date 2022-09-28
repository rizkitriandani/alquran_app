import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  // image: DecorationImage(
                  //     image: AssetImage('assets/images/decoration.png'),
                  //     fit: BoxFit.cover)
                ),
                child: const Center(child: Text("1")),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: const Text("Title",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.start),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: const Text(
                          "subtitle",
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
  }
}
