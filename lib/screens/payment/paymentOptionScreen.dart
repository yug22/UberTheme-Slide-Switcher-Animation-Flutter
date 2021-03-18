import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/payment/addCreditDebitCardScreen.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/paymentOptionWidget.dart';

class PaymentOptionScreen extends StatefulWidget {
  @override
  _PaymentOptionScreenState createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Align(
                alignment: Alignment.centerRight,
                child: textButtonAction(text: "do_this_later".tr())),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: Column(
            children: [
              Text(
                "Please select your preferred payment method",
                style: theme.otpTextStyle1,
                overflow: TextOverflow.visible,
              ),
              SizedBox(
                height: 80,
              ),
              PaymentOption(
                onTap: _addCard,
                icon: stringConstants.paymentIcon + "01.png",
                text: "Credit or debit card",
              ),
              PaymentOption(
                icon: stringConstants.paymentIcon + "02.png",
                text: "Paytm",
              ),
              PaymentOption(
                icon: stringConstants.paymentIcon + "03.png",
                text: "Cash",
              )
            ],
          ),
        ),
      ),
    );
  }

  _addCard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCreditDebitCardScreen(),
      ),
    );
  }
}
