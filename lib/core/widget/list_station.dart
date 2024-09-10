import 'package:flutter/material.dart';

class ListStation extends StatefulWidget {
   ListStation({Key? key,this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<ListStation> createState() => _ListStationState();
}

class _ListStationState extends State<ListStation> {
  List secilisehirler = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.antiAlias,
      shrinkWrap: true,
      children: secilisehirler.map((e) {
        return GestureDetector(
          onTap: () {
            setState(() {
              widget.controller!.value =
                  TextEditingValue(text: e['istasyonAdi']);
            });
            secilisehirler.clear();
          },
          child: ListTile(
            title: Text(e['istasyonAdi']),
          ),
        );
      }).toList(),
    );
  }
}
