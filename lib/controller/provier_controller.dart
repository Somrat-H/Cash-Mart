import 'dart:convert';

import 'package:cash_mart/model/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProviderController extends GetxController{
  ProviderModel? _providerModel;
  
  //Create function for calling getApi
  getProviderData()async{
    try{

      var response = await http.get(Uri.parse('https://admin.cashsmarts.co.uk/api/provider'));

      //statuscode 200 mean api call successfully
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        _providerModel = ProviderModel.fromJson(data);
      }

    }catch(e){
      //this e for print if any error got
      debugPrint(e.toString());
    }
  }
}