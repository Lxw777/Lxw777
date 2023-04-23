import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/data/provideData/checkinProvider.dart';

class MonthView extends StatefulWidget {
  const MonthView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MonthView();
}

class _MonthView extends State<MonthView> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController heatLevelController = TextEditingController();

  bool isOpacityMode = true;

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    heatLevelController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<DateTime, int> heatMapDatasets =
        Provider.of<CheckInProvider>(context, listen: false).readMap();
    return Column(
      children: [
        Card(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(20),

            // HeatMapCalendar
            child: HeatMapCalendar(
              initDate: DateTime.now(),
              flexible: true,
              datasets: heatMapDatasets,
              colorMode: isOpacityMode ? ColorMode.opacity : ColorMode.color,
              colorsets: const {
                1: Colors.red,
                3: Colors.orange,
                5: Colors.yellow,
                7: Colors.green,
                9: Colors.blue,
                11: Colors.indigo,
                13: Colors.purple,
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Color Mode'),
            CupertinoSwitch(
              value: isOpacityMode,
              onChanged: (value) {
                setState(() {
                  isOpacityMode = value;
                });
              },
            ),
            const Text('Opacity Mode'),
          ],
        ),
      ],
    );
  }
}
