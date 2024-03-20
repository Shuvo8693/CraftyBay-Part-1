import 'package:ecommerce_project/app_presentation/data/model/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvoiceOverView extends StatefulWidget {
  const InvoiceOverView({super.key, required this.paymentMethodGateway});

final PaymentMethod paymentMethodGateway;

  @override
  State<InvoiceOverView> createState() => _InvoiceOverViewState();
}

class _InvoiceOverViewState extends State<InvoiceOverView> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
     controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

          },
          onPageStarted: (String url) {
           // debugPrint("onPageStart: $url");
          },
          onPageFinished: (String url) {
            debugPrint("onPage Finished : $url");

          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('${widget.paymentMethodGateway.redirectGatewayURL}'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Overview'),
      ),
      body: WebViewWidget(controller: controller??WebViewController()),
    );
  }
}
