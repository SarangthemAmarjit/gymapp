import '../../models/usermodel.dart';

abstract class AuthenticationRepo{

  Future<String?> loginauth(String username,String pass);
  Future<User?> signupauth(String username,String pass);
  Future<User?> forgotpass(String phone,String pass);
  Future<String> sendOTP(String otp,String mins,String phone);
}