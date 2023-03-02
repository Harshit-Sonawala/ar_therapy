import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  // ..setNavigationDelegate(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        backgroundColor: Color(0xff2D2D2D),
        initialUrl: 'https://www.google.com',
        //     javaScriptMode: JavascriptMode.unrestricted,
        // setBackgroundColor: const Color(0xff2D2D2D),
        // loadRequest: WebViewRequest(uri: Uri.parse('https://flutter.dev'), method: WebViewRequestMethod.get),
      ),
    );
  }
}
