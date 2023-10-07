import 'package:flutter/material.dart';
import 'package:flutter_my_dog/authpage.dart';
import 'dart:async';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  int _start = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const authpage()),
        );
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.network('https://seeklogo.com/images/B/black-dog-circle-logo-7032FEC424-seeklogo.com.png'),
              ),
              Text(
                'My Dog',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(55.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 85, 85, 87)),
                  value: 1 - (_start / 5), // Adjusted value based on timer
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
