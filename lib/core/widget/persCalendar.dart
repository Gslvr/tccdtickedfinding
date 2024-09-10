import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';


// ignore: must_be_immutable
class CalenderChooser extends StatefulWidget {
  static final DateTime _bugun = DateTime.now();
  final DateTime _enEski = DateTime(_bugun.year - 18);

  DateTime selectedDate = _bugun;

  CalenderChooser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  Future getDateAndroid(
      {required BuildContext ctx, controller, controllerGizli}) {
    return showDatePicker(
            context: ctx,
            initialDate: _bugun,
            currentDate: _bugun,
            firstDate: _enEski,
            lastDate: _bugun)
        .then((selectedDate) {
      if (selectedDate != null) {
        controller.value = TextEditingValue(
            text:
                DateFormat.yMMMd().format(selectedDate));

        controllerGizli.value = TextEditingValue(
            text: formatDate(selectedDate, [yyyy, '-', mm, '-', dd]));
      }
    });
  }

  void getDateCupertino(BuildContext context, TextEditingController controller,
      TextEditingController controllerGizli) {
    return _showDialog(
      context: context,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CupertinoDatePicker(
              initialDateTime: _bugun,
              maximumDate: _bugun,
              minimumDate: _enEski,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                controller.value = TextEditingValue(
                    text: DateFormat.yMMMd()
                        .format(date));
                controllerGizli.value = TextEditingValue(
                    text: formatDate(date, [yyyy, '-', mm, '-', dd]));
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kapat")),
          )
        ],
      ),
    );
  }

  void _showDialog({required Widget child, required BuildContext context}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}