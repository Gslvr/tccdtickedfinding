import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcddbiletfinding/core/url_launch.dart';
import 'package:tcddbiletfinding/data/model/vagon_koltuk.dart';

class SuccessPosts extends StatelessWidget {
   SuccessPosts({
    super.key,
    required this.posts,
  });

  final List<KoltukDurum>? posts;
   bool goster = true;

  @override
  Widget build(BuildContext context) {
    // Group posts by 'saat'
    Map<String, List<KoltukDurum>> groupedPosts = {};
    for (var post in posts!) {
      if (!groupedPosts.containsKey(post.saat)) {
        groupedPosts[post.saat] = [];
      }
      groupedPosts[post.saat]!.add(post);
    }
   goster = groupedPosts.entries.length == 0 ? false : true;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(text: "Aradığınız tarihteki boş koltuk listesi.\n"),
                  TextSpan(
                      text: "Not: Engelli koltukları kırmızı renktedir.",
                      style: TextStyle(color: Colors.red)),
                ]),
          ),
          Flexible(
            flex: 6,
            child:goster? ListView(
              shrinkWrap: true,
              children: groupedPosts.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Text(
                        entry.key,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text("Vagon No",style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w900),),
                      Text("Koltuk No",style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w900)),
                      Text("Engelli ?",style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w900)),
                    ],),
                    const Divider(height: 10,color: Colors.redAccent,),
                    ...entry.value.map(
                      (element) => Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Card(
                          elevation: 0,
                          color: Colors.blueGrey[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(element.vagonSiraNo.toString()),
                              Text(element.koltukNo.toString()),
                              element.engellikoltuk
                                  ? const Icon(
                                      Icons.accessible_forward,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ):Text("Aradığınız tarihte boş koltuk bulunmamaktadır."),
          ),
        ],
      ),
    );
  }
}
