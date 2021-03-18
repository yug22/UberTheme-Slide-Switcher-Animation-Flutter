import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/main.dart';
import 'package:project/screens/authentication/loginWithSocialScreen.dart';
import 'package:project/screens/authentication/otpScreen.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/header.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phone = TextEditingController();
  String country_code = "+91";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Header(
            color: Colors.white,
            nomenu: false,
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 0, right: 00, top: 30, bottom: 0),
          child: Column(
            // shrinkWrap: true,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "please_enter_your_mobile_number".tr(),
                  style: theme.loginTextStyle1,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 0,
                      child: CountryCodePicker(
                        showDropDownButton: true,
                        onChanged: (value) {
                          setState(() {
                            country_code = value.toString();
                          });
                          print(
                              "Your country code is : ${country_code.toString()}");
                        },
                        initialSelection: 'IN',
                        favorite: ['+91', 'IN'],
                        padding: EdgeInsets.only(right: 0, left: 0),
                        showOnlyCountryWhenClosed: false,
                        // alignLeft: false,
                      ),
                    ),
                    Expanded(
                      child: textfield(
                          maxLength: 10,
                          controller: _phone,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          hintText: "081234 56789"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWithSocial(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    children: [
                      Text(
                        'or_connect_using_social_media'.tr(),
                        style: theme.loginTextStyle2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF2B6EF2),
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     TextButton(
              //       onPressed: () async {
              //         setState(() {
              //           context.locale = Locale('en', 'US');
              //         });
              //       },
              //       child: Text("English"),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         setState(() {
              //           context.locale = Locale('es', 'SP');
              //         });
              //       },
              //       child: Text("Spenish"),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.140,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'by_continuing_you_may_receive'.tr(),
                    overflow: TextOverflow.visible,
                    style: theme.loginTextStyle3,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              button(context, onPressed: () {
                if (_phone.text != null &&
                    _phone.text != "" &&
                    country_code != "") {
                  print("Your phone number is : ${_phone.text}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPScreen(
                        phone: _phone.text,
                        countryCode: country_code,
                      ),
                    ),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "please_enter_phone_no.".tr(),
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: theme.color_black,
                      textColor: theme.white,
                      fontSize: 16.0);
                }
              }, text: "next".tr()),
            ],
          ),
        ),
      ),
    );
  }
}
