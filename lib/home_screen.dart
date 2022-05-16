// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'no_internet.dart';

import 'connectivity.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if (Platform.isIOS) WebView.platform = CupertinoWebView();
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    // ignore: prefer_const_constructors
    return Consumer<ConnectivityProvider>(
        builder: (consumerContext, model, child) {
      if (model.isOnline != null) {
        return model.isOnline! ? pageUi() : NoInternet();
      }
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}

class pageUi extends StatefulWidget {
  const pageUi({Key? key}) : super(key: key);

  @override
  _pageUiState createState() => _pageUiState();
}

class _pageUiState extends State<pageUi> {
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExistingWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();

        if (isExistingWarning) {
          final massage = 'Press back again to exit';
          Fluttertoast.showToast(msg: massage, fontSize: 18);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: WebView(
            initialUrl:
                ('https://www.yummiesbbq.co.uk/index.php?route=mobileapp/home'),
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
