import 'package:gymwebapp/domains/repository/authenticationrepo.dart';
import 'package:gymwebapp/models/usermodel.dart';

class AuthenticationrepoImpl extends AuthenticationRepo{
  @override
  Future<User?> forgotpass(String phone, String pass) {
    // TODO: implement forgotpass
    throw UnimplementedError();
  }

  @override
  Future<User?> loginauth(String username, String pass) async{
      return User(uid: "01", uname: "Tomba nandeibam", phone: "7986543210", isadmin:0);
  }

  @override
  Future<String> sendOTP(String otp)async{
    return "nss";
  }

  @override
  Future<User?> signupauth(String username, String pass) async{
          return User(uid: "01", uname: "Tomba nandeibam", phone: "7986543210", isadmin:0);
  }

}