class OnboardingWords {
  String title;
  String subTititle;

  OnboardingWords({required this.title, required this.subTititle});
}

class OnboardingScreenModel {
  static final List<String> slideLists = [
    'assets/images/sliderone.png',
    'assets/images/slidertwo.png',
    'assets/images/sliderthree.png'
  ];

  static final List<OnboardingWords> descriptions = [
    OnboardingWords(
        title: 'Go beyond banking',
        subTititle:
            'Welcome to  the future. Carbon is your passport to world-class financial services, built just for you.'),
    OnboardingWords(
        title: 'Stay on top of your finances. Anytime. Anywhere',
        subTititle:
            'Carbon makes financial services faster, cheaper and more convenient. You can access the app 24/7, wherever you are.'),
    OnboardingWords(
        title: 'Trusted by millions',
        subTititle:
            '''With Carbon's market-leading service already used by millions of people just like you, you're in very good company.'''),
  ];
}
