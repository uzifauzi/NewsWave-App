import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewNewsPage extends StatefulWidget {
  final String url;

  const WebviewNewsPage({required this.url, super.key});

  @override
  State<WebviewNewsPage> createState() => _WebviewNewsPageState();
}

class _WebviewNewsPageState extends State<WebviewNewsPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {
            debugPrint("WebView error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baca Berita"),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
