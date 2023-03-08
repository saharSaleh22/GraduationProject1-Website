import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService{
  Dio dio =new Dio();
  login(name,password)async{
    try{
      return await dio.post('http://192.168.1.35:3002/authenticateWeb',data: {
        "name":name,                                               
        "password":password
      },options: Options(contentType: Headers.formUrlEncodedContentType)
      
      );
    }
    
     catch(e){
    
      Fluttertoast.showToast(msg: "e.response.data['msg']",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
      );
    }
  }
    loginCoach(name,password)async{
    try{
      return await dio.post('http://192.168.1.35:3002/authenticateCoach',data: {
        "name":name,                                               
        "password":password
      },options: Options(contentType: Headers.formUrlEncodedContentType)
      
      );
    }
    
     catch(e){
    
      Fluttertoast.showToast(msg: "e.response.data['msg']",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
      );
    }
  }
}
