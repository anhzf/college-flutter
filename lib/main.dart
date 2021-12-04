import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'pages/movie_list.dart';

Future main() async {
  await dotenv.load();

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: const MovieList(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
