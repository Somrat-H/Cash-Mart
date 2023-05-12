import 'dart:convert';
import 'package:cash_mart/ui/login_page.dart';
import 'package:cash_mart/ui/user_dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController{


  //this functin for check user log in or not by using token
  isLogin()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if(token !=null){
      Get.off(const UserDashboard());
    }
  }

  //this function for login the user by email and pass
  getLogIn(emailController, passwordController)async{
   
    try{
   
    var response = await http.post(Uri.parse('https://admin.cashsmarts.co.uk/api/consumer/login'), body: {
      'email' : emailController.text.toString(),
      'password' : passwordController.text.toString(),
    });
   
    
  // email : info@theflava.co.uk  pass: test12345
    
   if(response.statusCode == 200){
        var data = jsonDecode(response.body);
      
        debugPrint(data);
       
        //store the user token in local storage for future login and navigate direct user dashboard
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['_token'].toString());
        Get.off(const UserDashboard());
   }
    
  
    }catch(e){
     debugPrint(e.toString());
    }
  }


  //delete the user token and navigate the user to login
   logOut()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.off(LogPage());
  }

}