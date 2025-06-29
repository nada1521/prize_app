import 'package:flutter/material.dart';
import 'package:prize/core/widgets/main/app_circular_progress.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  final String url;
  final String title;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool _isLoading = false;

  late final controller = WebViewController()
    ..loadRequest(Uri.parse(widget.url))
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) async {
          debugPrint('> webView url: "$url"');
          setState(() => _isLoading = true);
        },
        onPageFinished: (url) {
          if (mounted) {
            Future.delayed(const Duration(milliseconds: 500), () {
              setState(() => _isLoading = false);
            });
          }
        },
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (_isLoading) const AppCircularProgress(),
        ],
      ),
    );
  }
}
