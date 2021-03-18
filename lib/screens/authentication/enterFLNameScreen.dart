import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/privacy&policy/privacy&policyScreen.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/header.dart';

class EnterFirstLastNameScreen extends StatefulWidget {
  @override
  _EnterFirstLastNameScreenState createState() =>
      _EnterFirstLastNameScreenState();
}

class _EnterFirstLastNameScreenState extends State<EnterFirstLastNameScreen> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Header(
            color: Colors.white,
            nomenu: true,
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "what's_your_name?",
                style: theme.otpTextStyle1,
                overflow: TextOverflow.visible,
              ).tr(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: textfield(
                        obscureText: false,
                        controller: _firstName,
                        hintText: "First"),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: textfield(
                        obscureText: false,
                        controller: _lastName,
                        hintText: "Last"),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: button(context, onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PrivacyAndPolicyScreen(),
            ),
          );
        }, text: "next".tr()),
      ),
    );
  }
}
