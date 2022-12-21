import 'package:flutter/material.dart';

// All the needed reuseable colors
const Color ccPrimaryColor = Color.fromRGBO(65, 24, 185, 1);
const Color ccInvalidColor = Color.fromARGB(255, 101, 101, 101);

// The reusabe Text Theme style
const TextStyle ccMainTitleStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

const TextStyle ccNormalBoldText =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

const TextStyle ccNormalMainTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

ccNavigateToNextPage(BuildContext context, Widget nextPage) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ));
}

ccNavigateToNextPageAndReplace(BuildContext context, Widget nextPage) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ));
}

ccNavigateToNextPageAndReplaceAllPreviousPages(
    BuildContext context, Widget nextPage) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => nextPage,
    ),
    (route) => false,
  );
}
