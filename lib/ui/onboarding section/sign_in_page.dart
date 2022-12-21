import 'package:carbon_app_copy/ui/home/home.dart';
import 'package:carbon_app_copy/ui/onboarding%20section/forget_password_flow/forget_password_start.dart';
import 'package:carbon_app_copy/ui/onboarding%20section/sign_up_page.dart';
import 'package:carbon_app_copy/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../utilities/popup_info.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 190,
                      height: 75,
                      child: Image.asset('assets/images/carbon_long_logo.png')),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Buttompopup(context: context);
                          });
                    },
                    icon: const Icon(
                      Icons.info,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Text(
                  'Welcome to Carbon!',
                  style: ccMainTitleStyle,
                ),
              ),
              const Text(
                'Complete your details below to continue to your Carbon account',
                style: ccNormalMainTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                child: IntlPhoneField(
                  decoration: const InputDecoration(labelText: 'Mobile Number'),
                  initialCountryCode: 'NG',
                  invalidNumberMessage: 'Incorrect phone format',
                  countries: const ['NG', 'ID'],
                  pickerDialogStyle: PickerDialogStyle(
                      searchFieldInputDecoration:
                          const InputDecoration(hintText: 'Country')),
                  dropdownIconPosition: IconPosition.trailing,
                ),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Carbon PIN'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.maxFinite, 60)),
                  onPressed: () {
                    ccNavigateToNextPageAndReplaceAllPreviousPages(
                        context, const Home());
                  },
                  child: const Text('Sign in'),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    ccNavigateToNextPage(context, const ForgetPasswordStart());
                  },
                  child: const Text('Forgot PIN'),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(''' Don't have a Carbon account?'''),
                      TextButton(
                          onPressed: () {
                            ccNavigateToNextPage(context, const SignUpPage());
                          },
                          child: const Text('Sign up'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
