import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({Key? key}) : super(key: key);

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  @override
  void initState() {

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    Future.delayed(Duration(seconds: 2), () {
      context.go("/home");
    });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("TCDD Bilet ",style: TextStyle(fontSize: 24,color:
              Colors.white),),
              Image.asset(
                      "Assets/img/trainstation.gif",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fitHeight,
                      gaplessPlayback: false,
                    ),
            ],
          )),
    );
  }
}
