import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:project/main.dart';
import 'package:project/screens/authentication/enterPasswordScreen.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/header.dart';

class OTPScreen extends StatefulWidget {
  String phone;
  String countryCode;
  OTPScreen({this.phone, this.countryCode});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Timer _timer;
  int _timeDuration = 59;
  int _start = 59;
  startTimer() {
    var oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
              const EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "enter_the_4_digit_code_sent_to_you_at",
                    style: theme.otpTextStyle1,
                    overflow: TextOverflow.visible,
                  ).tr(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.countryCode + " " + widget.phone}.",
                    style: theme.otpTextStyle2,
                    overflow: TextOverflow.visible,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PinEntryTextField(
                    isTextObscure: true,
                    onSubmit: (String pin) {},
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _start == 0
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _start = 59;
                        });
                        startTimer();
                        print("Code has been sent successfully");
                      },
                      child: Text(
                        "resend_code",
                        style: theme.otpTextStyle3,
                      ).tr(),
                    )
                  : Row(
                      children: [
                        Text(
                          "resend_code_in",
                          style: theme.otpTextStyle4,
                        ).tr(),
                        _start == 0 ? Text(" 00") : Text(" ${_start}"),
                      ],
                    )
            ],
          ),
        ),
        bottomNavigationBar: button(context, onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EnterPasswordScreen(),
            ),
          );
          print("OTP Screen to Enter Password : ");
        }, text: "next".tr()),
      ),
    );
  }
}
