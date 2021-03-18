import 'package:flutter/material.dart';

class ThemeConstants {
  Color color_black = Colors.black;
  Color white = Colors.white;
  Color blue = Color(0xFF2B6EF2);

  final kHintTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );

  final kLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final kBoxDecorationStyle = BoxDecoration(
    color: Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(18.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  final textStyleNormal = TextStyle(color: Colors.black);
  final textStyleW600 =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w600);
  final textStyleBold =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  final loginTextStyle1 = TextStyle(
    color: Colors.black,
    fontFamily: 'OpenSans',
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
  );

  final loginTextStyle2 = TextStyle(
    color: Color(0xFF2B6EF2),
    fontFamily: 'OpenSans',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );

  final loginTextStyle3 = TextStyle(
    color: Colors.grey,
    fontFamily: 'OpenSans',
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
  );

  final loginButtonStyle = TextStyle(
    letterSpacing: 1.5,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'OpenSans',
  );

  final otpTextStyle1 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'OpenSans',
  );

  final otpTextStyle2 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
  );

  final otpTextStyle3 = TextStyle(
    color: Color(0xFF2B6EF2),
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
  );

  final otpTextStyle4 = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
  );

  final social = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
  );

  TextStyle defaultStyle = TextStyle(
    color: Colors.black,
    fontSize: 15.0,
    fontFamily: 'OpenSans',
  );
  TextStyle linkStyle = TextStyle(
    color: Color(0xFF30688C),
    fontSize: 16,
    fontFamily: 'OpenSans',
  );

  final get_moving = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'OpenSans',
  );
  TextStyle frontCardTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );
}
