import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:gymwebapp/domains/repository/authenticationrepo.dart';
import 'package:gymwebapp/domains/usecase/usecasesimpl.dart';
import 'package:gymwebapp/models/usermodel.dart';
import 'package:http/http.dart' as http;

import '../config/const.dart';
class AuthenticationrepoImpl extends AuthenticationRepo{
  @override
  Future<User?> forgotpass(String phone, String pass) {
  
    throw UnimplementedError();
  }

  @override
  Future<String?> loginauth(String username, String pass) async{
    print("in login auth");
  String res = "";
    // Uri url =Uri.parse("http://10.10.1.96/api/Users/login?username=user1&password=userpass");
    Uri url =Uri.parse("http://10.10.1.96/api/Users/login");

    final query = {
      "username":username,
      "password":pass
    };
      try {
  final response = await http.post(
    url,
    headers: {
  //    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  // // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
  // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  // "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Content-Type":"application/json"
    },
    body:jsonEncode({
      "username":username,
      "password":pass
    })

  );
  res = response.body;
  print(response.body);
} on Exception catch (e) {
  print(e);
}
      // print(response.body);
        return res;
  }



  @override
  Future<String> sendOTP(String otp,String mins,String phone)async{
    //send otp to api 
    AuthenticateUseCase useCase = AuthenticateUseCase();
    Uri url = Uri.parse("$otpapi?apikey=$smsapikey&numbers=$phone&message=${useCase.registerOTP(otp, mins)}&sender=CUBETN");
    final res = await http.post(url);

      return res.statusCode.toString();
  }

  @override
  Future<User?> signupauth(String username, String pass) async{
          return User(uid: "01", uname: "Tomba nandeibam", phone: "7986543210", isadmin:0);
  }

}