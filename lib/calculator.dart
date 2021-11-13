// import 'number_formatter.dart';

class Calculator {
  static const PERIOD = '.';
  static const MULTIPLY = '*';
  static const SUBTRACT = '-';
  static const ADD = '+';
  static const DIVIDE = '/';
  static const CLEAR = 'CLEAR';
  static const BACKSPACE = 'BACKSPACE';
  static const EQUAL = '=';
  static const OPERATORS = [ADD, MULTIPLY, SUBTRACT, DIVIDE];
  static final findOperatorRegExp = RegExp(r'[+\/\-*]');

  final List<String> data = [];

  String get displayString => data.where((el) => el.isNotEmpty).join('');

  void addDigit(String toAdd) {
    if (data.isNotEmpty && !isContainsOperator(data.last)) {
      data.last += toAdd;
    } else {
      data.add(toAdd);
    }
  }

  void addOperator(String toAdd) {
    if (data.isNotEmpty) {
      if (isContainsOperator(data.last)) {
        data.last = toAdd;
      } else {
        data.add(toAdd);
      }
    }
  }

  void addPeriod() {
    // add period if last data is digits and not contains period
    // OR if last data is operator then create new data
    if (data.isNotEmpty) {
      final isDigitsOnly = !isContainsOperator(data.last);
      final isContainPeriod = data.last.contains(Calculator.PERIOD);

      if (isDigitsOnly) {
        if (!isContainPeriod) data.last += Calculator.PERIOD;
      } else
        data.add(Calculator.PERIOD);
    } else
      data.add(Calculator.PERIOD);
  }

  void backspace() {
    if (data.isNotEmpty) {
      final last = data.last;
      final lastLn = last.length;

      if (lastLn > 1) {
        data.last = last.substring(0, lastLn - 1);
      } else {
        data.removeLast();
      }
    }
  }

  void clear() {
    data.clear();
  }

  void calculate() {
    while (isContainsOperator(data.last) || data.last == Calculator.PERIOD) {
      data.removeLast();
    }

    for (int i = 0; i < data.length; i++) {
      final curr = data[i];

      if (curr == Calculator.MULTIPLY) {
        data[i - 1] =
            "${(double.parse(data[i - 1]) * double.parse(data[i + 1]))}";
        data.removeAt(i);
        data.removeAt(i);
        i--;
      } else if (curr == Calculator.DIVIDE) {
        data[i - 1] =
            "${double.parse(data[i - 1]) / double.parse(data[i + 1])}";
        data.removeAt(i);
        data.removeAt(i);
        i--;
      }
    }

    for (int i = 0; i < data.length; i++) {
      final curr = data[i];

      if (curr == Calculator.ADD) {
        data[i - 1] =
            "${double.parse(data[i - 1]) + double.parse(data[i + 1])}";
        data.removeAt(i);
        data.removeAt(i);
        i--;
      } else if (curr == Calculator.SUBTRACT) {
        data[i - 1] =
            "${double.parse(data[i - 1]) - double.parse(data[i + 1])}";
        data.removeAt(i);
        data.removeAt(i);
        i--;
      }
    }

    if (data.length != 1) throw Error();
  }

  static bool isContainsOperator(String char) =>
      findOperatorRegExp.hasMatch(char);
  static double add(double a, double b) => a + b;
  static double subtract(double a, double b) => a - b;
  static double divide(double a, double b) => a / b;
  static double multiply(double a, double b) => a * b;
}
