import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ccGemLabWeb extends StatefulWidget {
  @override
  ccGemLabWebState createState() => ccGemLabWebState();
}

class ccGemLabWebState extends State<ccGemLabWeb> {
  bool isLoading = true;
  String ccGemLabUrl = 'https://www.ccgemlab.com/index.php';
  WebViewController? webView;


  Future<bool> _onBack() async {
    var value = await webView!.canGoBack();

    if (value) {
      await webView!.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>_onBack(),
      child: Scaffold(
        body: Stack(
          children: [
            WebView(
              initialUrl: ccGemLabUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (url) {
                setState(() {
                  isLoading = true;
                });
              },
              onPageFinished: (status) {
                setState(() {
                  isLoading = false;
                });
              },
              onWebViewCreated: (WebViewController controller) {
                webView = controller;
              },
            ),
            isLoading
                ? Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: CircularProgressIndicator(),
                ))
                : Stack(),
          ],
        ),
      ),
    );
  }
}