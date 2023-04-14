import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MonthView extends StatefulWidget {
  const MonthView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MonthView();
}

class _MonthView extends State<MonthView> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController heatLevelController = TextEditingController();

  bool isOpacityMode = true;

  Map<DateTime, int> heatMapDatasets = {};

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    heatLevelController.dispose();
  }

  Widget _textField(final String hint, final TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20, top: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1.0)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF20bca4), width: 1.0)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          isDense: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(20),

                // HeatMapCalendar
                child: HeatMapCalendar(
                  flexible: true,
                  datasets: heatMapDatasets,
                  colorMode:
                      isOpacityMode ? ColorMode.opacity : ColorMode.color,
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
            _textField('YYYYMMDD', dateController),
            _textField('Heat Level', heatLevelController),
            ElevatedButton(
              child: const Text('COMMIT'),
              onPressed: () {
                setState(() {
                  heatMapDatasets[DateTime.parse(dateController.text)] =
                      int.parse(heatLevelController.text);
                });
              },
            ),

            // ColorMode/OpacityMode Switch.
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
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
