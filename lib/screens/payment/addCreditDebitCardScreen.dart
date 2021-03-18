import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/main.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/header.dart';
import 'package:project/screens/widgets/maskedTextInputFormatter.dart';

class AddCreditDebitCardScreen extends StatefulWidget {
  @override
  _AddCreditDebitCardScreenState createState() =>
      _AddCreditDebitCardScreenState();
}

class _AddCreditDebitCardScreenState extends State<AddCreditDebitCardScreen> {
  bool _showFrontSide;

  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _expiryDate = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _cardHolderName = TextEditingController();
  TextEditingController _postcode = TextEditingController();

  String cardNumber;

  String expiryDate = "mm/yy".tr();
  String cardHolder = "card_holder_name_:".tr(), cvv = "cvv".tr();

  handleReadOnlyInputClick(context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
              width: MediaQuery.of(context).size.width,
              child: YearPicker(
                selectedDate: DateTime(1997),
                firstDate: DateTime(1995),
                lastDate: DateTime.now(),
                onChanged: (val) {
                  print(val);
                  Navigator.pop(context);
                },
              ),
            ));
  }

  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Header(
            color: Colors.white,
            nomenu: true,
            title: "Add_Card".tr(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
          child: ListView(
            children: [
              Container(
                child: _buildFlipAnimation(),
              ),
              SizedBox(
                height: 30,
              ),
              textfield(
                inputFormatters: [
                  MaskedTextInputFormatter(
                    mask: 'xxxx xxxx xxxx xxxx',
                    separator: ' ',
                  ),
                ],
                maxLength: 19,
                keyboardType: TextInputType.numberWithOptions(),
                obscureText: false,
                controller: _cardNumber,
                hintText: "Card_Number".tr(),
                suffixIcon: Icon(
                  Icons.credit_card_outlined,
                  color: theme.color_black,
                  size: 30,
                ),
                onChanged: (val) {
                  setState(() {
                    cardNumber = val;
                  });
                },
                onTap: () {
                  setState(() {
                    _showFrontSide = true;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: textfield(
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask: 'mm/yy'.tr(),
                          separator: '/',
                        ),
                      ],
                      maxLength: 5,
                      keyboardType: TextInputType.numberWithOptions(),
                      obscureText: false,
                      controller: _expiryDate,
                      hintText: "Expiry_Date".tr(),
                      suffixIcon: Icon(
                        Icons.date_range_rounded,
                        color: theme.color_black,
                        size: 30,
                      ),
                      onChanged: (val) {
                        setState(() {
                          expiryDate = val;
                        });
                      },
                      onTap: () {
                        setState(() {
                          _showFrontSide = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: textfield(
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      controller: _cardHolderName,
                      hintText: "Card Holder Name".tr(),
                      suffixIcon: Icon(
                        Icons.person,
                        color: theme.color_black,
                        size: 30,
                      ),
                      onChanged: (val) {
                        setState(() {
                          cardHolder = val;
                        });
                      },
                      onTap: () {
                        setState(() {
                          _showFrontSide = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: textfield(
                        maxLength: 3,
                        onTap: () {
                          setState(() {
                            _showFrontSide = false;
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            _showFrontSide = true;
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        obscureText: false,
                        controller: _cvv,
                        hintText: "cvv".tr(),
                        suffixIcon: Icon(
                          Icons.check_circle_outline_rounded,
                          color: theme.color_black,
                          size: 30,
                        ),
                        onChanged: (val) {
                          setState(() {
                            cvv = val;
                            print("CVV == " + cvv);
                          });
                        }),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: textfield(
                      onTap: () {
                        setState(() {
                          _showFrontSide = true;
                        });
                      },
                      maxLength: 8,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      controller: _postcode,
                      hintText: "Postal Code".tr(),
                      suffixIcon: Icon(
                        Icons.location_on_outlined,
                        color: theme.color_black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _showFrontSide
            ? _buildFront(cardNumber, expiryDate, cardHolder)
            : _buildRear(cvv),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    ); // FocusScope.of(context).requestFocus(focusNode);
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront(cardNumber, expiryDate, cardHolder) {
    return __buildLayoutFront(
      key: ValueKey(true),
      backgroundColor: theme.color_black,
      cardNumber: cardNumber,
      expireDate: expiryDate,
      cardHolder: cardHolder,
    );
  }

  Widget _buildRear(cvv) {
    return __buildLayoutRear(
      key: ValueKey(false),
      cvv: cvv,
      backgroundColor: Colors.grey,
    );
  }

  Widget __buildLayoutFront(
      {Key key,
      Widget child,
      Color backgroundColor,
      String cardNumber,
      String expireDate,
      String cardHolder}) {
    return Container(
      key: key,
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.300,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Credit_&_Debit_Card".tr(),
                      style: theme.frontCardTextStyle),
                  Icon(
                    Icons.credit_card_outlined,
                    color: theme.white,
                    size: 40,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: cardNumber == null || cardNumber == ""
                  ? Text("XXXX XXXX XXXX XXXX", style: theme.frontCardTextStyle)
                  : Text(cardNumber, style: theme.frontCardTextStyle),
            ),
            Expanded(
              child: Row(
                children: [
                  Text("Exp. Date :".tr(), style: theme.frontCardTextStyle),
                  SizedBox(
                    width: 10,
                  ),
                  expireDate == null || expireDate == ""
                      ? Text("mm/yy".tr(), style: theme.frontCardTextStyle)
                      : Text(expireDate.toString(),
                          style: theme.frontCardTextStyle),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: cardHolder == null || cardHolder == ""
                        ? Text("Card Holder Name :".tr(),
                            overflow: TextOverflow.ellipsis,
                            style: theme.frontCardTextStyle)
                        : Text(cardHolder,
                            overflow: TextOverflow.ellipsis,
                            style: theme.frontCardTextStyle),
                  ),
                  Image.asset(
                    stringConstants.paymentIcon + "05.png",
                    height: 80,
                    width: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget __buildLayoutRear(
      {Key key, Widget child, String cvv, Color backgroundColor}) {
    return Container(
      key: key,
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.300,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.color_black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.500,
                    decoration: BoxDecoration(
                      color: theme.white,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.120,
                    decoration: BoxDecoration(
                      color: theme.white,
                    ),
                    child: Center(
                      child: cvv == null || cvv == ""
                          ? Text("cvv".tr(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black))
                          : Text(cvv,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
