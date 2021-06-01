import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'drawer.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '/landing-page';
  final String? email;
  final String? password;

  LandingPage({this.email, this.password});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _url = "https://www.ticketmaster.de/user/";
  WebViewController? controller;

  void sportButton(String newUrl) {
    setState(() {
      _url = newUrl;
      controller?.loadUrl(newUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Applore',
          style: TextStyle(
              fontFamily: 'Titillium Web',
              fontStyle: FontStyle.normal,
              fontSize: 25),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: _url,
        onWebViewCreated: (WebViewController webView) {
          controller = webView;
        },
      ),
      drawer: AppDrawer(sportButton),
    );
  }
}
