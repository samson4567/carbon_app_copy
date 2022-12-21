import 'package:carbon_app_copy/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/onboarding section/forget_password_flow/forget_password_start.dart';
import '../ui/support/customer_support.dart';

class Buttompopup extends StatelessWidget {
  const Buttompopup({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20)),
          color: Colors.white),
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ListTile(
            title: Text(
              'Having issues logging in?',
              style: ccMainTitleStyle,
            ),
          ),
          const Divider(
            thickness: 2.5,
          ),
          ListTile(
            title: const Text('I forgot my PIN'),
            leading: const Icon(
              CupertinoIcons.lock_circle_fill,
              color: ccPrimaryColor,
              size: 35,
            ),
            trailing: const Icon(Icons.forward),
            onTap: () {
              ccNavigateToNextPage(context, const ForgetPasswordStart());
            },
          ),
          const Divider(
            thickness: 2.5,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              title: const Text('Get in touch with us'),
              leading: const Icon(
                CupertinoIcons.lock_circle_fill,
                color: ccPrimaryColor,
                size: 35,
              ),
              trailing: const Icon(Icons.forward),
              onTap: () {
                ccNavigateToNextPage(context, const ContactCustomerSupport());
              },
            ),
          ),
        ],
      ),
    );
  }
}
