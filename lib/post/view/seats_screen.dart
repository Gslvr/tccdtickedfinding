import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tcddbiletfinding/core/enums/post_status_enum.dart';
import 'package:tcddbiletfinding/data/model/vagon_koltuk.dart';
import 'package:tcddbiletfinding/post/view/widgets/success_posts.dart';
import '../block/seats_block/post_bloc.dart';

class SeatsScreen extends StatefulWidget {
  SeatsScreen({Key? key, required this.tarih}) : super(key: key);

  final DateTime tarih;

  @override
  State<SeatsScreen> createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  late List<KoltukDurum> koltukListesi;
  List? vagonlar;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<SeatsBloc>().state;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('dd MMM, yyyy').format(widget.tarih)),
      ),
      body: BlocBuilder<SeatsBloc, SeatsState>(
        builder: (context, state) {
          if (state.status == PageStatus.failure) {
            return  Center(
              child: Text("${state.errorMessages}"),
            );
          }
          if (state.status == PageStatus.success) {
            return SuccessPosts(posts: state.list);
          }
          return const Center(
            child: CircularProgressIndicator(strokeCap: StrokeCap.round,),
          );
        },
      ),
    );
  }
}
