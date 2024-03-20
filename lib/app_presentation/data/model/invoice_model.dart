import 'package:ecommerce_project/app_presentation/data/model/payment_method.dart';

class InvoiceModel {
  String? msg;
  List<PaymentSummery>? paymentSummery;

  InvoiceModel({this.msg, this.paymentSummery});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      paymentSummery = <PaymentSummery>[];
      json['data'].forEach((v) {
        paymentSummery!.add(PaymentSummery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (paymentSummery != null) {
      data['data'] = paymentSummery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentSummery {
  List<PaymentMethod>? paymentMethod;
  int? payable;
  int? vat;
  int? total;

  PaymentSummery({this.paymentMethod, this.payable, this.vat, this.total});

  PaymentSummery.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethod = <PaymentMethod>[];
      json['paymentMethod'].forEach((v) {
        paymentMethod!.add(PaymentMethod.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paymentMethod != null) {
      data['paymentMethod'] =
          paymentMethod!.map((v) => v.toJson()).toList();
    }
    data['payable'] = payable;
    data['vat'] = vat;
    data['total'] = total;
    return data;
  }
}


