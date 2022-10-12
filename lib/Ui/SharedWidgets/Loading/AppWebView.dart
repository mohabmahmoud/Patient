import 'dart:io';

import 'package:flutter/material.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatefulWidget {
  String action;
  AppWebView({Key? key, required this.action}) : super(key: key);

  @override
  AppWebViewState createState() => AppWebViewState();
}

class AppWebViewState extends State<AppWebView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print(Helper.aPI.webUrl+widget.action);
    return Scaffold(appBar: AppBar(),body:WebView(
      initialUrl:Helper.aPI.webUrl+widget.action,
      javascriptMode:JavascriptMode.unrestricted,
      zoomEnabled: true,


    ));
  }
}