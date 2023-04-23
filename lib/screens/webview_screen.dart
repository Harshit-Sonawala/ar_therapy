import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String passedSearchQuery;

  const WebviewScreen({
    this.passedSearchQuery = 'Most common physiotherapy conditions',
    super.key,
  });

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  // ..setNavigationDelegate(
  @override
  Widget build(BuildContext context) {
    String formattedSearchQuery = widget.passedSearchQuery.replaceAll(' ', '+');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.passedSearchQuery,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        // backgroundColor: const Color(0xffFFFFFF),
        initialUrl: 'https://www.google.com/search?q=$formattedSearchQuery',
        // initialUrl: 'https://www.google.com',
        //     javaScriptMode: JavascriptMode.unrestricted,
        // setBackgroundColor: const Color(0xff2D2D2D),
        // loadRequest: WebViewRequest(uri: Uri.parse('https://flutter.dev'), method: WebViewRequestMethod.get),
      ),
    );
  }
}
