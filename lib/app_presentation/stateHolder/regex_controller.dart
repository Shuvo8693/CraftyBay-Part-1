
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RegexController extends GetxController{
  ValueNotifier<String> transID=ValueNotifier('');
 String? urlTran;
 WebViewController? webViewController;
// https://ecom-api.teamrabbil.com/api/PaymentFail?tran_id=65fcc6a46d45d
  //https://ecom-api.teamrabbil.com/api/PaymentSuccess?tran_id=65fccd1d11fa4
  regExFunction({ String? url}){
    urlTran= url??'';
    RegExp regExp =RegExp(r'PaymentSuccess[?]tran_id=([a-zA-Z0-9]+)');
    Match? match=regExp.firstMatch(url??'');
    transID.value=match?[1]??'';
  }

 void  webViewControllerMethod(BuildContext context,String redirectGatewayURL){
   webViewController=WebViewController();
  webViewController?.setJavaScriptMode(JavaScriptMode.unrestricted);
  webViewController?.setBackgroundColor(const Color(0x00000000));
  webViewController?.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {

        },
        onPageStarted: (String url) {
          regExFunction(url: url);
          debugPrint("onPageStart: $url");
          debugPrint("onPageStart: ${url.endsWith('success')}");
          if(url.endsWith('success')==true){
            Get.showSnackbar(const GetSnackBar(
              title: ' success',
              message: ' Payment successful ',
              isDismissible: true,
              duration: Duration(seconds: 2),
            ));
           /* ValueListenableBuilder(valueListenable: transID, builder: (context, value,__){
              if(value.isNotEmpty && value !='6fb7eb2ca5' && url.isNotEmpty){
                showDialog(context: (context), builder: (context){
                  return  AlertDialog(
                    title: Text('trans_id:success'),
                  );
                });
              }
              return Text('');
            });*/

          }else if(url.endsWith('Failed')==true){
            Get.showSnackbar(const GetSnackBar(
              title: 'failed',
              message: 'payment failed',
              isDismissible: true,
              duration: Duration(seconds: 2),
            ));
          }
          ///--
          if (transID.value.isNotEmpty && transID.value != '6fb7eb2ca5' &&
              url.isNotEmpty) {
            showDialog(context: (context), builder: (context) {
              return const AlertDialog(
                title: Text('Payment Successful'),
              );
            });
          }
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
    );



  //webViewController?.loadRequest(Uri.parse(redirectGatewayURL));
  }
   initializeGatewayUrl(String redirectGatewayURL){
    webViewController?.loadRequest(Uri.parse(redirectGatewayURL));
  }


}