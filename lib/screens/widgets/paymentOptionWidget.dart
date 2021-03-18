import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  String icon;
  String text;
  GestureTapCallback onTap;

  PaymentOption({this.text, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                child: Image.asset(icon),
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
