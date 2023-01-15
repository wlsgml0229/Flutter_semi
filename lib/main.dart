import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OunwanList extends StatefulWidget {
  const OunwanList({Key? key}) : super(key: key);

  @override
  State<OunwanList> createState() => _OunwanListState();
}

class _OunwanListState extends State<OunwanList> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();


  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid){
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('오운완'),
          automaticallyImplyLeading: true,
        ),
        body: Builder(builder: (BuildContext context){
          return WebView(
            initialUrl: '주소설정',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          );
        },
        ),
      ),
    );
  }
}