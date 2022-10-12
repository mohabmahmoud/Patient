// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../Constants/widthAndHeight.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.bottomCenter,
                  height: getHeight(context) / 2,
                  child: Center(child: Image.asset('images/nointernet.png'))),
              const Text(
                'تعذر الاتصال بالانترنت ',
                style: TextStyle(
                    fontFamily: 'mohab', color: Colors.redAccent, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
