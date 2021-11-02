import 'package:college_flutter_app/utils/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const measures = [
  'meters',
  'kilometers',
  'grams',
  'kilograms',
  'feet',
  'miles',
  'pounds (lbs)',
  'ounces',
];

void main() => runApp(
      MaterialApp(
        home: MyApp(),
        theme: ThemeData.dark(),
      ),
    );

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('K3519010 - Measure Converter'),
      ),
      body: Container(
        child: SingleChildScrollView(child: child),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const gapY = SizedBox(height: 24);
  final _formKey = GlobalKey<FormState>();
  ConversionData conversionData = new ConversionData();
  String resultMsg = '';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            // Field
            Text('Values', style: Theme.of(context).textTheme.bodyText1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Insert value to convert',
                  icon: Icon(Icons.input),
                  filled: true,
                ),
                keyboardType: TextInputType.number,
                validator: (v) {
                  return double.tryParse(v!) == null
                      ? 'Failed to parse value'
                      : null;
                },
                onChanged: (v) {
                  setState(() {
                    conversionData.numberFrom = double.parse(v);
                  });
                },
              ),
            ),
            gapY,
            Text('From', style: Theme.of(context).textTheme.bodyText1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: DropdownButtonFormField(
                value: conversionData.measureFrom,
                isExpanded: true,
                items: measures
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.swap_horiz),
                ),
                onChanged: (v) => setState(() {
                  conversionData.measureFrom = v.toString();
                }),
              ),
            ),
            gapY,
            Text('To', style: Theme.of(context).textTheme.bodyText1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: DropdownButtonFormField(
                value: conversionData.measureTo,
                isExpanded: true,
                items: measures
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.swap_horiz),
                ),
                onChanged: (v) => setState(() {
                  conversionData.measureTo = v.toString();
                }),
              ),
            ),
            gapY,
            ElevatedButton(
              child: const Text('CONVERT'),
              onPressed: onConvertClick,
            ),
            gapY,
            Text(
              resultMsg,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }

  void onConvertClick() {
    setState(() {
      if (conversionData.result != null) {
        resultMsg =
            '${conversionData.numberFrom} ${conversionData.measureFrom} are ${conversionData.result} ${conversionData.measureTo}';
      } else {
        resultMsg = 'This conversion cannot be performed';
      }
    });
  }
}

class ConversionData {
  double numberFrom = 0;
  String measureFrom = 'meters';
  String measureTo = 'meters';

  double? get result => Converter.convert(numberFrom, measureFrom, measureTo);
}
