import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/main.dart';
import 'package:project/screens/privacy&policy/learnMoreScreen.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/header.dart';

class PrivacyAndPolicyScreen extends StatefulWidget {
  @override
  _PrivacyAndPolicyScreenState createState() => _PrivacyAndPolicyScreenState();
}

class _PrivacyAndPolicyScreenState extends State<PrivacyAndPolicyScreen> {
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
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  "https://image.flaticon.com/icons/png/512/1698/1698591.png",
                  height: 120,
                  width: 120,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "By tapping the arrow below, you agree to NOW Terms of use and Privacy Policy",
                style: theme.otpTextStyle1,
                overflow: TextOverflow.visible,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      style: theme.defaultStyle,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'By clicking Sign Up, you agree to our '),
                        TextSpan(
                            text: 'Terms of Service',
                            style: theme.linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Service"');
                              }),
                        TextSpan(text: ' and that you have read our '),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: theme.linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Privacy Policy"');
                              }),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        bottomNavigationBar: button(context, onPressed: () {
          _getPermission();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => LearnMoreScreen(),
          //   ),
          // );
        }, text: "next".tr()),
      ),
    );
  }

  /// permission function ///
  _getPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      // Permission.storage,
    ].request();
    var status = await Permission.camera.status;
    if (status.isGranted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LearnMoreScreen(),
        ),
      );
    } else if (status.isRestricted) {
      Permission.contacts.request().isGranted;
    } else if (await Permission.contacts.request().isGranted) {
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Camera Permission'),
                content: Text('Please allow camera, location permissions.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    }
  }
}
