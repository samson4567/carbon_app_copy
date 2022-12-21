import 'package:carbon_app_copy/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'forget_password_second_screen.dart';

class ForgetPasswordStart extends StatefulWidget {
  const ForgetPasswordStart({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordStart> createState() => _ForgetPasswordStartState();
}

class _ForgetPasswordStartState extends State<ForgetPasswordStart> {
  bool isValid = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController mobileNumberinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: ccPrimaryColor, // add custom icons also
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0.0,
        title: LinearPercentIndicator(
          width: h * 0.65,
          lineHeight: 4.0,
          percent: 0.25,
          linearStrokeCap: LinearStrokeCap.round,
          backgroundColor: ccInvalidColor,
          progressColor: ccPrimaryColor,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70, bottom: 20),
                child: Text(
                  'Reset PIN',
                  style: ccMainTitleStyle,
                ),
              ),
              const Text(
                'Please fill out these basic details to reset your PIN.',
                style: ccNormalMainTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 40),
                child: IntlPhoneField(
                  controller: mobileNumberinput,
                  onChanged: (value) {
                    if (value.completeNumber.length ==
                        mobileNumberinput.text.length) {
                      isValid = true;
                    }
                  },
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
              TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                        Icons.calendar_month_outlined), //icon of text field
                    labelText: "Date of Birth" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1960), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        if (mobileNumberinput.text.isNotEmpty &&
                            dateinput.text.isNotEmpty) {
                          ccNavigateToNextPage(
                              context, const ForgetPasswordVerification());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: (mobileNumberinput.text.isNotEmpty &&
                                  dateinput.text.isNotEmpty)
                              ? ccPrimaryColor
                              : ccInvalidColor,
                          fixedSize: const Size(double.maxFinite, 60)),
                      child: const Text('Continue')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
