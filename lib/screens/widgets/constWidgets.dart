import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/main.dart';

Widget textfield(
    {TextEditingController controller,
    Icon prefixIcon,
    String hintText,
    TextStyle hintStyle,
    TextStyle style,
    final bool obscureText,
    TextInputType keyboardType,
    Widget suffixIcon,
    ValueChanged<String> onChanged,
    ValueChanged<String> onSubmitted,
    GestureTapCallback onTap,
    int maxLength,
    List<TextInputFormatter> inputFormatters}) {
  return TextField(
    inputFormatters: inputFormatters,
    onChanged: onChanged,
    maxLength: maxLength,
    onTap: onTap,
    onSubmitted: onSubmitted,
    controller: controller,
    obscureText: obscureText,
    style: style,
    keyboardType: keyboardType,
    cursorColor: theme.color_black,
    decoration: InputDecoration(
      counterText: '',
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.color_black),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.color_black),
      ),
      suffixIcon: suffixIcon,
      // contentPadding: EdgeInsets.only(top: 14.0),
      prefixIcon: prefixIcon,
      hintText: hintText,
      hintStyle: TextStyle(
        fontFamily: 'OpenSans',
      ),
    ),
  );
}

Widget button(BuildContext context, {VoidCallback onPressed, String text}) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
    child: ButtonTheme(
      height: MediaQuery.of(context).size.height * 0.060,
      minWidth: double.maxFinite,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        textColor: theme.white,
        color: Colors.black,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(letterSpacing: 1, fontSize: 18),
        ),
      ),
    ),
  );
}

Widget textButton({String text, GestureTapCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        color: Color(0xFF30688C),
      ),
    ),
  );
}

Widget textButtonAction({String text, GestureTapCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        color: Color(0xFF30688C),
      ),
    ),
  );
}
