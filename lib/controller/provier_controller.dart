import 'dart:convert';

import 'package:cash_mart/model/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProviderController extends GetxController{
  ProviderModel? providerModel;
  final List<Data> data = [];


  //Create function for calling getApi
  getProviderData()async{
    try{

      var response = await http.get(Uri.parse('https://admin.cashsmarts.co.uk/api/provider'));

      //statuscode 200 mean api call successfully
      if(response.statusCode == 200){
        var s = jsonDecode(response.body);
        
       providerModel = ProviderModel.fromJson(s);


      //here store provider data for higlights value 1 and store into datamodel type list.
      for(var i = 0; i < 8; i++){
       if(providerModel!.data![i].highlight == 1){
        data.add(providerModel!.data![i]);
       }
      }
      }
    }catch(e){
      //this e for print if any error got
      debugPrint(e.toString());
    }
  }
}