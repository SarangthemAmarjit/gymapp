import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'dart:math';
// // ignore: avoid_web_libraries_in_flutter
// import 'dart:js' as js;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/domains/repository/authenticationrepo.dart';
import 'package:gymwebapp/domains/usecase/usecasesimpl.dart';
import 'package:gymwebapp/models/authenticationrepoimpl.dart';
import 'package:http/http.dart' as http;


import '../domains/payementrepo/paymentrepo.dart';
import '../domains/usecase/domainusecases.dart';
import '../models/usermodel.dart';
import '../router/router.gr.dart';


class GetxTapController extends GetxController
    with GetSingleTickerProviderStateMixin{
  final BuildContext context;
  
  bool _ispaymentprocessstarted = false;

  GetxTapController({required this.context});
  //table

  final AuthenticationRepo authenticationOptions = AuthenticationrepoImpl();
  bool _isadminlogin = false;
  bool auth = false;
  bool otploading = false;
  User? user;
  bool get isadminlogin => _isadminlogin;
  final AuthUseCases authusecase = AuthenticateUseCase();
  int otp = 1234;
  void loginpagehandler({required bool isadmin}) {
    _isadminlogin = isadmin;
    update();
  }


  void authenticate(String username,String pass) async{

      //check the login username and user password
    await authenticationOptions.loginauth(username, pass).then((value){
      
      update();
  
      print(value);
   
      context.router.push(DashboardRoute(uid:"290"));

    });
  }


  void sendotp(String phone){
    int rand = Random().nextInt(9000) + 1000;
    otp = rand;
    print(otp);
    // authenticationOptions.sendOTP(rand.toString(), "10",phone);
    
  }

  bool confirmotp(String confirmotp){
    otploading = true;
    update();
    Timer(const Duration(seconds: 2),(){
      otploading = false;
      update();
    });
    return confirmotp == otp.toString();
  }


void callpayment() async{

  try {
    // Create a client and open a persistent connection
    final resonse = await http.post(Uri.parse("https://paynetzuat.atomtech.in/paynetz/epi/fts?login=9273&encdata=EEFE91104888339DC842075EDBBCC10D9E9FBE7D6E995F62D2AC79802CA4579D39E92D34530E3EB547638BF7B78D3E5239CE4C3BF4443C44B5D0E65A6B2BEEED4F6612D93B4AE551D36F9E3EA1704CC0222711EB6F4BC8C90260DE0726A12FBD94A0DA4336548747F5B3597C516872B171331E70685D1589CCD1FEA6A1E88239D3BFA35073A95205AE4F810CAB32D8ED7AA98B5BAA25DF8AC4471511D92BFF86C3322F9D18490D383735AAADA6DF5F57A1CAC7A7F13C621BCF8CE125EEE9812810041982292DD0EA68B637AFE9211309965501106E25530353576F3B59F3E2B92CBAA3C53471E9F32FDEF88AD6DC06781EFB3677A71120262C3D39DE684F796CADB39B030B565F386AF4DFFA96EEF050E088D324C6569299B42876F743727420678EDB4718A4CDE695B54E5B1819C662B3DCF1DE2B9F28CA49FD839FE88DA6FB5111FFEBBFD94B77007F938B77D1EC954FD07BBF0EAFB188F3A810A9D5CC90DFF37EAA2C1510E881E97D060B4C789C6C330BB26BBE53F7D4985DCF6DEA120F35124E94F34DD6666AC9CBF977B6710390E609455B5CBEA1751A75EFF45CED14DD66C4BE0B484544B84BE0008193B8DFFFFD954BAC8E4C739F002175C068936AA89CF6B7DBBFE00C1291F7007A8989F299FBCE4142EA5DE87A929F27E7A64BED1FAE0DCDA17F6C6561685F9F030EFEAE38D82DE5F1AD7C47C4509DB93AED74FCCCA6E62DD1D1938E39DDD926ABA7D9BF3B2C15BD7DDF6D868CECEB67F5D65BA3E64D45FFAA7CA6D6EC84607550DEDBAAE59D36B885B79D72A213707FA9CFBBD51C5E5D2FE3C3026CBA4602B43DAA0BAA2D"),
    headers: {
'Access-Control-Allow-Origin':'*',
'Content-Type': 'application/json',
    }
    );
    print(resonse.body);

  } catch (e) {
    print('Error: $e');
  }


}




///PAYMENTS
///
///
///
///


  // P A Y M E N T   GATEWAY

  // merchant configuration data
  final String login = "317159"; //"445842"; //mandatory
  final String password = 'Test@123'; //mandatory
  final String prodid = 'NSE'; //mandatory
  final String requestHashKey = 'KEY123657234'; //mandatory
  final String responseHashKey = 'KEYRESP123657234'; //mandatory
  final String requestEncryptionKey =
      'A4476C2062FFA58980DC8F79EB6A799E'; //mandatory
  final String responseDecryptionKey =
      '75AEF0FA1B94B3C10D4F5B268F757F11'; //mandatory
  // final String txnid =
  //     'test240223'; // mandatory // this should be unique each time
  final String clientcode = "NAVIN"; //mandatory
  final String txncurr = "INR"; //mandatory
  final String mccCode = "5499"; //mandatory
  final String merchType = "R"; //mandatory
  // final String amount = "1.00"; //mandatory

  final String mode = "uat"; // change live for production

  // final String custFirstName = 'test'; //optional
  // final String custLastName = 'user'; //optional
  // final String mobile = '8888888888'; //optional
  // final String email = 'test@gmail.com'; //optional
  // final String address = 'mumbai'; //optional
  final String custacc = '639827'; //optional
  final String udf1 = "udf1"; //optional
  final String udf2 = "udf2"; //optional
  final String udf3 = "udf3"; //optional
  final String udf4 = "udf4"; //optional
  final String udf5 = "udf5"; //optional

  final String authApiUrl = "https://caller.atomtech.in/ots/aipay/auth"; // uat

  // final String auth_API_url =
  //     "https://payment1.atomtech.in/ots/aipay/auth"; // prod

  final String returnUrl =
      "https://pgtest.atomtech.in/mobilesdk/param"; //return url uat
  // final String returnUrl =
  //     "https://payment.atomtech.in/mobilesdk/param"; ////return url production

  final String payDetails = '';


  



  void sendpaymentinfo({
    required int gazetteId,
    required String postalname,
    required String fulladdress,
    required String pincode,
    required int totalprice,
    required String enteredby,
    required String remark,
  }) async {
    gettransactionid();
    print('1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111');
    try {
      final response = await http.post(
          Uri.parse('http://10.10.1.139:8099/api/Billings/MakePayment'),
          headers: {
            'Content-Type': 'application/json', // Set the Content-Type header
          },
          body: jsonEncode(
            {
              "gazetteId": gazetteId,
              "fullname": postalname,
              "fulladdress": fulladdress,
              "pincode": pincode,
              "totalprice": totalprice,
              "enteredby": enteredby,
              "remark": remark,
              "transactionid": "3647367"
            },
          ));

      if (response.statusCode == 200) {
       print('Done Post Successfully');
      } else {
        print('Failedrerer to Getdata.');
        //  _isserverok = false;
      }
      return null;
    } catch (e) {
      // _isserverok = false;

       print('init log $e');
    }
  }
  


  void gettransactionid() {
    String generateRandomString(int length) {
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      final random = math.Random();
      return List.generate(
              length, (index) => characters[random.nextInt(characters.length)])
          .join();
    }

     String  transacid = generateRandomString(10);
    update();
    print(transacid);
  }

void initNdpsPayment(
      {required BuildContext context,
      required String responseHashKey,
      required String responseDecryptionKey,
      required String name,
      required String amount,
      required String address}) {
    _ispaymentprocessstarted = true;
    update();
    _getEncryptedPayUrl(
        context: context,
        responseHashKey: responseHashKey,
        responseDecryptionKey: responseDecryptionKey,
        name: name,
        amount: amount,
        address: address);
  }

  _getEncryptedPayUrl(
      {required BuildContext context,
      required String responseHashKey,
      required String responseDecryptionKey,
      required String name,
      required String amount,
      required String address}) async {
    String reqJsonData =
        _getJsonPayloadData(name: name, amount: amount, address: address);
    debugPrint(reqJsonData);
    const platform = MethodChannel('flutter.dev/NDPSAESLibrary');
    
    try {

      // final String result = js.context.callMethod('initAES', ["encrypt", reqJsonData, requestHashKey]);
      // final String result = await platform.invokeMethod('NDPSAESInit', {
      //   'AES_Method': 'encrypt',
      //   'text': reqJsonData, // plain text for encryption
      //   'encKey': requestEncryptionKey // encryption key
      // });
      // String authEncryptedString = result.toString();
      // here is result.toString() parameter you will receive encrypted string
      // debugPrint("generated encrypted string: '$authEncryptedString'");
      // _getAtomTokenId(context, authEncryptedString);
    } catch (e) {
      debugPrint("Failed to get encryption string: '$e'.");
    }
  }

  _getAtomTokenId(context, authEncryptedString) async {
    print("atom token channel");
   // Construct the URL
  final String url = 'https://paynetzuat.atomtech.in/paynetz/epi/fts';
final String corsProxy = 'http://localhost:59503/';
  // Create a JSON-encoded body
  final Map<String, String> body = {
    'login': login,
    'encdata': authEncryptedString,
  };

  try {
    // Create a client and open a persistent connection
    final resonse = await http.post(Uri.parse("https://paynetzuat.atomtech.in/paynetz/epi/fts?login=9273&encdata=EEFE91104888339DC842075EDBBCC10D9E9FBE7D6E995F62D2AC79802CA4579D39E92D34530E3EB547638BF7B78D3E5239CE4C3BF4443C44B5D0E65A6B2BEEED4F6612D93B4AE551D36F9E3EA1704CC0222711EB6F4BC8C90260DE0726A12FBD94A0DA4336548747F5B3597C516872B171331E70685D1589CCD1FEA6A1E88239D3BFA35073A95205AE4F810CAB32D8ED7AA98B5BAA25DF8AC4471511D92BFF86C3322F9D18490D383735AAADA6DF5F57A1CAC7A7F13C621BCF8CE125EEE9812810041982292DD0EA68B637AFE9211309965501106E25530353576F3B59F3E2B92CBAA3C53471E9F32FDEF88AD6DC06781EFB3677A71120262C3D39DE684F796CADB39B030B565F386AF4DFFA96EEF050E088D324C6569299B42876F743727420678EDB4718A4CDE695B54E5B1819C662B3DCF1DE2B9F28CA49FD839FE88DA6FB5111FFEBBFD94B77007F938B77D1EC954FD07BBF0EAFB188F3A810A9D5CC90DFF37EAA2C1510E881E97D060B4C789C6C330BB26BBE53F7D4985DCF6DEA120F35124E94F34DD6666AC9CBF977B6710390E609455B5CBEA1751A75EFF45CED14DD66C4BE0B484544B84BE0008193B8DFFFFD954BAC8E4C739F002175C068936AA89CF6B7DBBFE00C1291F7007A8989F299FBCE4142EA5DE87A929F27E7A64BED1FAE0DCDA17F6C6561685F9F030EFEAE38D82DE5F1AD7C47C4509DB93AED74FCCCA6E62DD1D1938E39DDD926ABA7D9BF3B2C15BD7DDF6D868CECEB67F5D65BA3E64D45FFAA7CA6D6EC84607550DEDBAAE59D36B885B79D72A213707FA9CFBBD51C5E5D2FE3C3026CBA4602B43DAA0BAA2D"),
    headers: {
'Access-Control-Allow-Origin':'*',
'Content-Type': 'application/json',
    }
    );
    print(resonse.statusCode);

  } catch (e) {
    print('Error: $e');
  }


//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//        print('200');
//       try {
//   var authApiResponse = await response.stream.bytesToString();
//   final split = authApiResponse.trim().split('&');
//   print(authApiResponse);
//   final Map<int, String> values = {
//     for (int i = 0; i < split.length; i++) i: split[i]
//   };
//   final splitTwo = values[1]!.split('=');
  
//   if (splitTwo[0] == 'encData') {
//     // const platform = MethodChannel('flutter.dev/NDPSAESLibrary');
//     try {
//            final String result = js.context.callMethod('initAES', ["encrypt", splitTwo[1].toString(), responseDecryptionKey]);
//       // final String result = await platform.invokeMethod('NDPSAESInit', {
//       //   'AES_Method': 'decrypt',
//       //   'text': splitTwo[1].toString(),
//       //   'encKey': responseDecryptionKey
//       // });
//       debugPrint(result.toString()); // to read full response
//       var respJsonStr = result.toString();
//       Map<String, dynamic> jsonInput = jsonDecode(respJsonStr);
//       if (jsonInput["responseDetails"]["txnStatusCode"] == 'OTS0000') {
//         final atomTokenId = jsonInput["atomTokenId"].toString();
//         debugPrint("atomTokenId: $atomTokenId");
//         final String payDetails =
//             '{"atomTokenId" : "$atomTokenId","merchId": "$login","emailId": "sag@gm.com","mobileNumber":"9436001287", "returnUrl":"$returnUrl"}';
//         _openNdpsPG(
//             payDetails, context, responseHashKey, responseDecryptionKey);
//       } else {
//         debugPrint("Problem in auth API response");
//       }
//     } catch(e) {
//       debugPrint("Failed to decrypt: '$e.");
//     }
//   }
// } on Exception catch (e) {
//   print(e);
// }
//     }
  }

  _openNdpsPG(payDetails, BuildContext context, responseHashKey,
      responseDecryptionKey) {
    context.router
        .push(AtomPaymentPage(
            mode: mode,
            payDetails: payDetails,
            responsehashKey: responseHashKey,
            responseDecryptionKey: responseDecryptionKey))
        .whenComplete(() {
      _ispaymentprocessstarted = false;
      update();
    });
  }

  _getJsonPayloadData(
      {required String name, required String amount, required String address}) {
    var payDetails = {};
    payDetails['login'] = login;
    payDetails['password'] = password;
    payDetails['prodid'] = prodid;
    payDetails['custFirstName'] = name;
    payDetails['custLastName'] = '';
    payDetails['amount'] = amount;
    payDetails['mobile'] = "363767367378";
    payDetails['address'] = address;
    payDetails['email'] = "sa@gm.com";
    payDetails['txnid'] ="367367567365";
    payDetails['custacc'] = custacc;
    payDetails['requestHashKey'] = requestHashKey;
    payDetails['responseHashKey'] = responseHashKey;
    payDetails['requestencryptionKey'] = requestEncryptionKey;
    payDetails['responseencypritonKey'] = responseDecryptionKey;
    payDetails['clientcode'] = clientcode;
    payDetails['txncurr'] = txncurr;
    payDetails['mccCode'] = mccCode;
    payDetails['merchType'] = merchType;
    payDetails['returnUrl'] = returnUrl;
    payDetails['mode'] = mode;
    payDetails['udf1'] = udf1;
    payDetails['udf2'] = udf2;
    payDetails['udf3'] = udf3;
    payDetails['udf4'] = udf4;
    payDetails['udf5'] = udf5;
    String jsonPayLoadData = getRequestJsonData(payDetails);
    return jsonPayLoadData;
  }




}
