import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: Row(
                children: [
                  Image.asset('assets/images/leftarrowused.png'),
                  const SizedBox(
                    width: 95,
                  ),
                  const Text(
                    'Exchange Rates',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 93,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xff523CF8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/united-states.jpg'),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'USD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Container(
                      height: 60,
                      width: 173,
                      child: TextField(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: listOfCountryCurrency.length,
                itemBuilder: (context, index) {
                  ExchangeRateModel info = listOfCountryCurrency[index];
                  return ExchangeRateHistory(
                    dataToUse: info,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExchangeRateHistory extends StatelessWidget {
  const ExchangeRateHistory({Key? key, required this.dataToUse})
      : super(key: key);
  final ExchangeRateModel dataToUse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [Image.asset(dataToUse.flagePath), Text(dataToUse.currency)],
      ),
    );
  }
}

class ExchangeRateModel {
  String flagePath;
  String currency;
  String currencyRate;
  String changeRate;

  ExchangeRateModel({
    required this.flagePath,
    required this.currency,
    required this.currencyRate,
    required this.changeRate,
  });
}

List<ExchangeRateModel> listOfCountryCurrency = [
  ExchangeRateModel(
      flagePath: 'assets/images/united-kingdom.jpg',
      currency: 'GDP',
      currencyRate: '1 GBP = 1.2321246',
      changeRate: '0.77'),
  ExchangeRateModel(
      flagePath: 'assets/images/european-union.jpg',
      currency: 'EUR',
      currencyRate: '1 EUR = 1.1823456',
      changeRate: '0.85'),
];
