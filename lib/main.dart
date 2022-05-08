import 'package:flutter/material.dart';
import 'package:schoolmanagement/module/widgets.dart';
import 'module/estension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeViews());
  }
}

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Container(color: Colors.red, height: context.height * 0.20),
          Button(
            color: Colors.red,
            title: "Clicl me",
            onTap: () {},
            padding: const EdgeInsets.all(22),
          ),
          "saalam".toLabel()
        ],
      )),
    );
  }
}
