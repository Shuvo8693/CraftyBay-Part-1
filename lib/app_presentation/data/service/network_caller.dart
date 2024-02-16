import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../model/response_data.dart';

class NetworkCaller{
  Future<ResponseData> getRequest(String url, {String? token})async{

      Response response = await get(Uri.parse(url),headers: {
        'token':token.toString(),
        'content-type':'application/json',
      });
      log(response.statusCode.toString());
      log(response.body);
      log(response.headers.toString());

      if (response.statusCode == 200) {
        final decodeBody = jsonDecode(response.body);

        if (decodeBody['msg'] == 'success') {
          return ResponseData(
              message: 'success',
              statusCode: response.statusCode,
              responseData: decodeBody);
        } else if (decodeBody['msg'] == 'fail') {
          return ResponseData(
              isSuccess: false,
              message: decodeBody['data'].toString()=='{}' ? 'Authentication Failed':'',
              statusCode: response.statusCode,
              responseData: decodeBody);
        } else {
          return ResponseData(
              isSuccess: false,
              message: decodeBody['data']?.toString() ?? ' Failed ',
              statusCode: response.statusCode,
              responseData: decodeBody);
        }
      } else {
        return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: jsonDecode(response.body));
      }
  }


  Future<ResponseData> postRequest(String url,Map<String,dynamic>? body,String token)async{

    Response response = await post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'token': token.toString(),
          'content-type': 'application/json'
        });
    log(response.statusCode.toString());
    log(response.body);
    if(response.statusCode==200){
       final decodeBody= jsonDecode(response.body);

      if(decodeBody['msg']=='success') {
        return ResponseData(
            message: 'success',
            statusCode: response.statusCode,
            responseData: decodeBody);

      }else{
        return ResponseData(
            isSuccess: false,
            message: decodeBody['data'].toString(),
            statusCode: response.statusCode,
            responseData: decodeBody);
      }
    }else{
      return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: jsonDecode(response.body));
    }
  }
}