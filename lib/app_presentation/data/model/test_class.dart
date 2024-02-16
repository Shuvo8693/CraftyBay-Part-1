

import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';

class TestProfile{
  String? abc;
  String? xyz;
  TestProfile({ this.abc, this.xyz});

  fromJson(Map<String,dynamic>data){
    abc=data['abc'];
    xyz=data['xyz'];
  }

 Map<String,dynamic> toJson(){
    final Map<String,dynamic>data={};
    data['abc']=abc;
    data['xyz']=xyz;

    return data;
}

}

abstract class Measurement{
  void size(
    String text
      );
  void weight(
      int text
      );
}
class Sizing extends Measurement{
  @override
  void size(String text) {
       Text(text);
  }

  @override
  void weight(int text) {
    // TODO: implement weight
  }

}
class MapTest extends StatefulWidget {
  const MapTest({super.key});

  @override
  State<MapTest> createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  List values= [
    {"name": "Screwdriver", "price": 42.00},
    {"name": "Wingnut", "price": 0.50}
  ];
  void test(){
    var resultOfValues=values.map((product) => product['price'] as double);
     var totalValue=resultOfValues.fold(0.0, (previousValue, element) => previousValue + element);
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

      ],
    );
  }
}

