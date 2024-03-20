import 'package:ecommerce_project/app_presentation/data/model/invoice_model.dart';
import 'package:ecommerce_project/app_presentation/data/model/payment_method.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/invoice_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/invoice_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((__) {
      Get.find<InvoiceState>().getInvoice();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: GetBuilder<InvoiceState>(
        builder: (invoiceState) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
               Text('Payable: \$${invoiceState.invoiceModel?.payable??0}',style: const TextStyle(fontSize: 18),),
               Text('Vat: \$${invoiceState.invoiceModel?.vat??0}',style: const TextStyle(fontSize: 18),),
               Text('Total: \$${invoiceState.invoiceModel?.total??0}',style: const TextStyle(fontSize: 18),),
                const SizedBox(height: 10,),

                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return ListTile(
                          onTap: (){
                           print('${invoiceState.invoiceModel?.paymentMethod![index].redirectGatewayURL}');
                           Get.to(()=>InvoiceOverView(paymentMethodGateway: invoiceState.invoiceModel?.paymentMethod![index]??PaymentMethod(),));
                          },
                          leading: Image.network('${invoiceState.invoiceModel?.paymentMethod?[index].logo}'),
                          title: Text('${invoiceState.invoiceModel?.paymentMethod?[index].name}'),
                          subtitle: Text('${invoiceState.invoiceModel?.paymentMethod?[index].gw}'),
                          trailing: const Icon(Icons.arrow_forward),
                        );
                      },
                      separatorBuilder: (_,__)=>const Divider(height: 1,),
                    itemCount: invoiceState.invoiceModel?.paymentMethod?.length??0,),
                )

              ],
            ),
          );
        }
      ),
    );
  }
}
