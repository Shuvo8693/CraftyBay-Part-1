import 'package:ecommerce_project/app_presentation/data/model/payment_method.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/regex_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvoiceOverView extends StatefulWidget {
  const InvoiceOverView({Key? key, required this.paymentMethodGateway}) : super(key: key);

final PaymentMethod paymentMethodGateway;


  @override
  State<InvoiceOverView> createState() => _InvoiceOverViewState();
}

class _InvoiceOverViewState extends State<InvoiceOverView> {
  String? transID;
  String? urlTran;
  WebViewController? _webViewController;
  RegexController? regexController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<RegexController>().webViewController=WebViewController();
      Get.find<RegexController>().initializeGatewayUrl(widget.paymentMethodGateway.redirectGatewayURL??'');
       regexController=Get.find<RegexController>();
      Get.find<RegexController>().webViewControllerMethod(context, widget.paymentMethodGateway.redirectGatewayURL??'');
      Get.find<RegexController>().regExFunction();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Overview'),
      ),
        body: GetBuilder<RegexController>(
            builder: (regexController) {
          regexController.webViewControllerMethod(
              context, widget.paymentMethodGateway.redirectGatewayURL ?? '');
          Get.find<RegexController>().initializeGatewayUrl(
              widget.paymentMethodGateway.redirectGatewayURL ?? '');
          return WebViewWidget(
              controller:
                  regexController.webViewController ?? WebViewController());
        }));
  }
  /* regexController?.webViewControllerMethod(context, widget.paymentMethodGateway.redirectGatewayURL??'');
  Get.find<RegexController>().initializeGatewayUrl(widget.paymentMethodGateway.redirectGatewayURL??'');
  return WebViewWidget(controller: regexController?.webViewController??WebViewController());*/
}


