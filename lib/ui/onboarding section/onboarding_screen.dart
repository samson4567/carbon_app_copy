import 'package:carbon_app_copy/data/model/onboarding_screen_model.dart';
import 'package:carbon_app_copy/ui/onboarding%20section/sign_in_page.dart';
import 'package:carbon_app_copy/utilities/constants.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> _slides = OnboardingScreenModel.slideLists;
  final List<OnboardingWords> _descriptions =
      OnboardingScreenModel.descriptions;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    width: 160,
                    height: 70,
                    child: Image.asset('assets/images/carbon_long_logo.png')),
              ),
              SizedBox(
                height: 300,
                width: double.maxFinite,
                child: PageView.builder(
                    itemCount: _slides.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                              width: 250,
                              height: 250,
                              child: Image.asset(_slides[index])),
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _slides.length,
                  (index) => buildDot(index, context),
                ),
              ),
              SizedBox(
                height: 200,
                width: double.maxFinite,
                child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      var texts = _descriptions[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Text(
                              texts.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: ccPrimaryColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              texts.subTititle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ccPrimaryColor,
                          minimumSize: const Size(double.maxFinite, 60),
                        ),
                        child: const Text('Setup new account'))),
              ),
              TextButton(
                  onPressed: () {
                    ccNavigateToNextPage(context, const SignInPage());
                  },
                  child: const Text(
                    'Have an account? Sign in',
                    style: ccMainTitleStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    setState(() {
      currentIndex == index ? 25 : 10;
    });
    return Container(
      height: 10,
      width: currentIndex.toDouble(),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ccPrimaryColor,
      ),
    );
  }
}
