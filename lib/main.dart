import 'package:flutter/material.dart';
import 'components/layout_main.dart';
import 'calculator.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
        theme: ThemeData.dark(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Calculator calculator = new Calculator();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final calcBtn = themedCalculatorBtn(theme);
    final calcBtnLabel = themedCalculatorBtnLabel(theme);

    return MainLayout(
      title: 'Calculator',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              color: theme.colorScheme.surface,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  calculator.displayString,
                  textScaleFactor: 2,
                ),
              ),
            ),
          ),
          /* Delete actions related */
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: calcBtn(
                    child: calcBtnLabel('C'),
                    secondary: true,
                    onPressed: () => _onPressed(Calculator.CLEAR),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: calcBtn(
                    child: Icon(
                      Icons.backspace,
                      color: theme.colorScheme.onPrimary,
                    ),
                    secondary: true,
                    onPressed: () => _onPressed(Calculator.BACKSPACE),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...[
                        ['1', '2', '3'],
                        ['4', '5', '6'],
                        ['7', '8', '9'],
                      ]
                          .map((e) => Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: e
                                      .map((ee) => Expanded(
                                            child: calcBtn(
                                              child: calcBtnLabel(ee),
                                              onPressed: () => _onPressed(ee),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ))
                          .toList(),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: calcBtn(
                                child: calcBtnLabel(Calculator.PERIOD),
                                onPressed: () => _onPressed(Calculator.PERIOD),
                              ),
                            ),
                            Expanded(
                              child: calcBtn(
                                child: calcBtnLabel('0'),
                                onPressed: () => _onPressed('0'),
                              ),
                            ),
                            Expanded(
                              child: calcBtn(
                                child: calcBtnLabel(Calculator.EQUAL),
                                secondary: true,
                                onPressed: () => _onPressed(Calculator.EQUAL),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Calculator.MULTIPLY,
                      Calculator.DIVIDE,
                      Calculator.ADD,
                      Calculator.SUBTRACT,
                    ]
                        .map((e) => Expanded(
                              child: calcBtn(
                                child: calcBtnLabel(e),
                                secondary: true,
                                onPressed: () => _onPressed(e),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed(String btnText) {
    if (btnText == Calculator.BACKSPACE) {
      return setState(calculator.backspace);
    }

    // On CLEAR press
    if (btnText == Calculator.CLEAR) {
      return setState(calculator.clear);
    }

    // On EQUALS press
    if (btnText == Calculator.EQUAL) {
      return setState(calculator.calculate);
    }

    // On OPERATOR press
    if (Calculator.OPERATORS.contains(btnText)) {
      return setState(() => calculator.addOperator(btnText));
    }

    // On PERIOD press
    if (btnText == Calculator.PERIOD) {
      return setState(calculator.addPeriod);
    }

    return setState(() => calculator.addDigit(btnText));
  }
}

typedef ThemedCalculatorBtn = Widget Function({
  required Widget child,
  VoidCallback? onPressed,
  bool secondary,
});

typedef ThemedCalculatorBtnLabel = Widget Function(String label);

ThemedCalculatorBtn themedCalculatorBtn(ThemeData theme) => ({
      required child,
      onPressed,
      secondary = false,
    }) =>
        Container(
          margin: EdgeInsets.all(4),
          child: TextButton(
            child: child,
            style: TextButton.styleFrom(
              backgroundColor:
                  secondary ? theme.primaryColorDark : theme.primaryColor,
            ),
            onPressed: onPressed,
          ),
        );

ThemedCalculatorBtnLabel themedCalculatorBtnLabel(ThemeData theme) =>
    (label) => Text(
          label,
          style: theme.textTheme.button?.merge(TextStyle(
            fontSize: theme.textTheme.headline5?.fontSize,
          )),
        );
