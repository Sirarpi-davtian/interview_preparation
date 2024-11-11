import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  assert(isPalindrome("abcba"));
  assert(isPalindrome("a"));
  assert(isPalindrome(""));
  assert(isPalindrome("abbcba") == false);

  // runApp(const MyApp());
}

bool isPalindrome(String string) {
  if (string.length <= 1) {
    log('true');
    return true;
  }

  for (int i = 0, limit = string.length ~/ 2; i <= limit; ++i) {
    if (string[i] != string[string.length - 1 - i]) {
      log('false');

      return false;
    }
  }
  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
