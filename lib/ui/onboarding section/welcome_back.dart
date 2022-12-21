// ignore_for_file: use_build_context_synchronously

import 'package:carbon_app_copy/data/model/local_auth_api.dart';
import 'package:carbon_app_copy/ui/onboarding%20section/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../../utilities/constants.dart';
import '../../utilities/popup_info.dart';
import '../home/home.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({Key? key}) : super(key: key);

  @override
  State<WelcomeBackPage> createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  String userFirstName = 'Ayanfe';
  bool isBottomSheetVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Image.asset('assets/images/carbon_long_logo.png'),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Buttompopup(context: context);
                            });
                      },
                      icon: const Icon(CupertinoIcons.question_circle_fill))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back, \n$userFirstName!',
                          style: ccMainTitleStyle,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: SizedBox(
                            width: 250,
                            child: Text(
                                'Enter your PIN to continue to your Carbon account.'),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/images/secondprofile.png',
                          fit: BoxFit.fill),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldStyle: FieldStyle.underline,
                  style: const TextStyle(fontSize: 20),
                  obscureText: true,
                  fieldWidth: 50,
                  otpFieldStyle: OtpFieldStyle(
                      enabledBorderColor: ccPrimaryColor,
                      borderColor: ccPrimaryColor,
                      focusBorderColor: ccPrimaryColor),
                  onChanged: ((value) {}),
                  onCompleted: (pin) {
                    ccNavigateToNextPageAndReplace(context, const Home());
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Buttompopup(context: context);
                      });
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Forget PIN?',
                    style: ccNormalBoldText,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final isAutheticate = await LocalAuthApi.authenticate();

                  if (isAutheticate) {
                    ccNavigateToNextPageAndReplace(context, const Home());
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(color: ccPrimaryColor),
                          right: BorderSide(color: ccPrimaryColor),
                          top: BorderSide(color: ccPrimaryColor),
                          bottom: BorderSide(color: ccPrimaryColor)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.fingerprint_rounded,
                    color: ccPrimaryColor,
                    size: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not $userFirstName?',
                      style: ccNormalBoldText,
                    ),
                    TextButton(
                        onPressed: (() {
                          ccNavigateToNextPageAndReplace(
                              context, const OnboardingScreen());
                        }),
                        child: const Text(
                          'Sign out',
                          style: ccNormalBoldText,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
