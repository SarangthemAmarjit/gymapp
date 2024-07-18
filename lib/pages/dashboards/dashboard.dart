import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymwebapp/config/colors.dart';
import 'package:gymwebapp/router/router.gr.dart';
import 'package:gymwebapp/widget/actionbutton.dart';
import 'package:gymwebapp/widget/cardwithshadow.dart';
import 'package:gymwebapp/widget/normaltext.dart';
import 'package:gymwebapp/widget/titletext.dart';


@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, this.uid});
  final String? uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Row(
        children: [
          SizedBox(
              height: double.maxFinite,
              width: 300,
              child: CardWithShadow(
                  radius: BorderRadius.zero,
                  color: primaryblacks,
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(24),
                                child: NormalText(
                                  text: "Home",
                                  size: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(24),
                                child: NormalText(
                                  text: "Renew",
                                  size: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(24),
                                child: NormalText(
                                  text: "Pay monthly fees",
                                  size: 16,
                                ),
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(24),
                                child: NormalText(
                                  text: "Settings",
                                  size: 16,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (c) =>  AlertDialog(
    title: Text("SignOut"),
    content: Text("Are you sure you want to SignOut?"),
    actions: [
     TextButton(
    child: Text("No"),
    onPressed:  () {

        Navigator.pop(context);

    },
      ),
      TextButton(
    child: Text("logout"),
    onPressed:  () {

        context.router.popAndPush(RouteHandlerPage());

    },
      )
    ],
      )
    );
                                },
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: EdgeInsets.all(24),
                                    child: NormalText(
                                      text: "Sign Out",
                                      size: 16,
                                    ),
                                  ),
                                )),
                          ],
                        ))
                      ],
                    ),
                  ))),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child: CardWithShadow(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleText(
                                    text: "Membership",
                                    size: 20,
                                  ),
                                  NormalText(
                                    text: "General",
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleText(
                                    text: "Pricing",
                                    size: 20,
                                  ),
                                  NormalText(
                                    text: "3 Months",
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CardWithShadow(
                          margin: EdgeInsets.zero,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: double.maxFinite,
                                      child: CardWithShadow(
                                        margin: EdgeInsets.all(16),
                                        padding: EdgeInsets.all(16),
                                        isshadow: true,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleText(
                                                  text: "Renewal",
                                                  size: 20,
                                                ),
                                                NormalText(
                                                  text: "2 weeks remaining",
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                            ActionButton(
                                              onpress: () {},
                                              text: "Renew",
                                              padding: EdgeInsets.all(24),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 150,
                                      width: double.maxFinite,
                                      child: CardWithShadow(
                                        margin: EdgeInsets.all(16),
                                        padding: EdgeInsets.all(16),
                                        isshadow: true,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TitleText(
                                              text: "Renewal",
                                              size: 20,
                                            ),
                                            NormalText(
                                              text: "2 weeks remaining",
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 150,
                                      width: double.maxFinite,
                                      child: CardWithShadow(
                                        margin: EdgeInsets.all(16),
                                        padding: EdgeInsets.all(16),
                                        isshadow: true,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TitleText(
                                              text: "Renewal",
                                              size: 20,
                                            ),
                                            NormalText(
                                              text: "2 weeks remaining",
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          )),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}


