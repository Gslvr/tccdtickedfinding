import 'package:flutter/material.dart';
import 'package:tcddbiletfinding/data/model/vagon_koltuk.dart';

class SuccessPosts extends StatelessWidget {
  const SuccessPosts({
    super.key,
    required this.posts,
  });

  final List<KoltukDurum>? posts;

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

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Aradığınız tarihteki boş koltuk listesi. Not: Engelli koltukları kırmızı renktedir."),
          Flexible(
            flex: 6,
            child: ListView(
              shrinkWrap: true,
              children: groupedPosts.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    ...entry.value.map((element) => Container(
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
                        )),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
