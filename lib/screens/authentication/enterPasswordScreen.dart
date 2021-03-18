import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/authentication/enterFLNameScreen.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/header.dart';

class EnterPasswordScreen extends StatefulWidget {
  @override
  _EnterPasswordScreenState createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  TextEditingController _password = TextEditingController();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
              const EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "welcome_back",
                style: theme.otpTextStyle1,
                overflow: TextOverflow.visible,
              ).tr(),
              SizedBox(
                height: 30,
              ),
              textfield(
                controller: _password,
                obscureText: _obscureText,
                hintText: "enter_your_password".tr(),
                suffixIcon: IconButton(
                  icon: _obscureText
                      ? Icon(
                          Icons.visibility_off,
                          color: theme.color_black,
                        )
                      : Icon(
                          Icons.visibility,
                          color: theme.color_black,
                        ),
                  onPressed: () {
                    _toggle();
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              textButton(
                  text: "i_forgot_my_password".tr(),
                  onTap: () {
                    print("click on the forgot my password");
                  }),
              SizedBox(
                height: 20,
              ),
              textButton(
                  text: "i_don't_have_an_account".tr(),
                  onTap: () {
                    print("click on the not an account");
                  }),
              SizedBox(
                height: 20,
              ),
              textButton(
                  text: "i_can't_sign_in".tr(),
                  onTap: () {
                    print("click on the can't sign in");
                  })
            ],
          ),
        ),
        bottomNavigationBar: button(context, onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EnterFirstLastNameScreen(),
            ),
          );
          print("OTP Screen to Enter Password : ");
        }, text: "next".tr()),
      ),
    );
  }
}
