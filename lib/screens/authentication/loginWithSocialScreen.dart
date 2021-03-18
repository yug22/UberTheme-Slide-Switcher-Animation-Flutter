import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/widgets/header.dart';

class LoginWithSocial extends StatefulWidget {
  @override
  _LoginWithSocialState createState() => _LoginWithSocialState();
}

class _LoginWithSocialState extends State<LoginWithSocial> {
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
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "choose_an_account",
                style: theme.otpTextStyle1,
              ).tr(),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      new AssetImage(
                        stringConstants.imgPath + "fb-logo.png",
                      ),
                      color: theme.blue,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "fb",
                    style: theme.social,
                  ).tr(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                        stringConstants.imgPath + "google-logo.png"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "google",
                    style: theme.social,
                  ).tr(),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "by_clicking_on_a_social_option",
                style: theme.social,
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
