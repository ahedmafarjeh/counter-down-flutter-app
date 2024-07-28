import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: CounterDown(),
    );
  }
}

class CounterDown extends StatefulWidget {
  const CounterDown({super.key});

  @override
  State<CounterDown> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDown> {
  int counter = 7;
  Timer? timerHndler;
  count() {
    timerHndler = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 40, 34),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (counter > 0) ? "${counter.toString().padLeft(2, "0")}" : "👌",
                style: (counter > 0)
                    ? TextStyle(color: Colors.white, fontSize: 80)
                    : TextStyle(fontSize: 50),
              ),
              Text(
                "seconds",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      count();
                      if (counter == 0) {
                        setState(() {
                          counter = 7;
                        });
                      }
                    },
                    child: Text("Start Timer",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      timerHndler!.cancel();
                    },
                    child: Text("Stop Timer",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.pinkAccent),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
