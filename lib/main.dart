import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green grocer',
      theme: ThemeData(
        primarySwatch:
            Colors.green, //cor dos campos de texto, borda, appbar etc
        //cor de todos os scaffolds q criarmos e nao atribuirmos uma cor
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
