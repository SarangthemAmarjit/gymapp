import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/controller/tapcontroller.dart';
import 'package:gymwebapp/router/router.gr.dart';

@RoutePage()
class WebLoginPage extends StatelessWidget {
  const WebLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController(context: context));

    return GetBuilder<GetxTapController>(builder: (_) {
      return Scaffold(
        body: Center(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: Container(
              child: Row(
                children: [
                MediaQuery.sizeOf(context).width<700?const SizedBox(): Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/cover.png', // Replace with the actual URL or asset path of the image
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo.png', // Replace with the actual URL or asset path of the image
                            height: 100,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.isadminlogin ? 'ADMIN PANEL' : 'USER LOGIN',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          controller.isadminlogin
                              ? Column(
                                  children: [
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.green)),
                                        suffixIcon: Icon(Icons.visibility),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Wrap(
                                        alignment: WrapAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Checkbox(
                                                  value: true,
                                                  onChanged: (value) {}),
                                              const Text('Keep me logged in'),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text('Forgot password?'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const TextField(
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.grey),
                                    labelText: 'Enter Your Mobile Number',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                controller.isadminlogin ? 'Log in' : 'Submit',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              color: const Color.fromARGB(255, 245, 243, 236),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller.isadminlogin
                                            ? "For User Login "
                                            : "For Admin Login",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.loginpagehandler(
                                              isadmin: controller.isadminlogin
                                                  ? false
                                                  : true);
                                        },
                                        child: const Text(" Click here"),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "New Registration ?",
                                        style:
                                            TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.router.push(const GymFormPage());
                                        },
                                        child: const Text(" Click here"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FittedBox(
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Terms of Use'),
                                ),
                                const Text('|'),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Privacy Policy'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
