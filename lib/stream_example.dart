import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                  stream: dataStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data ?? '');
                    } else {
                      return const Text('No data');
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: dataStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data ?? '');
                    } else {
                      return const Text('No data');
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    controller: textEditingController,
                  )),
              ElevatedButton(
                onPressed: () {
                  streamController.add(textEditingController.text);
                  print(textEditingController.text);
                },
                child: const Text('done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// /********** example 2 */
// class Cake {}

// class Order {
//   String type;
//   Order(this.type);
// }

// void main() {
//   final controller = StreamController();

//   final order = Order('jdcbjsdchg');

//   final baker = StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
//     if (cakeType == 'chocolate') {
//       sink.add(Cake());
//     } else {
//       sink.addError('I can not cake that type');
//     }
//   });

//   controller.sink.add(order);

//   controller.stream
//   .map((order) => order.type)
//   .transform(baker)
//   .listen(
//       (cake) => print('Here is rour $cake'),
//       onError: (err) => print(err));
// }
