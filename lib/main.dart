import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'total_payment.dart';
import 'default_payment.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '부트페이 결제 데모 프로젝트'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              TextButton(
                  onPressed: () => Get.to(DefaultPayment()),
                  child: const Text('1. PG일반 결제 테스트', style: TextStyle(fontSize: 16.0))
              ),
              TextButton(
                  onPressed: () => Get.to(TotalPayment()),
                  child: const Text('2. 통합결제 테스트', style: TextStyle(fontSize: 16.0))
              ),
            ],
          ),
        ),
      ),
    );
  }
}