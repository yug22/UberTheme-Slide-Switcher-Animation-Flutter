import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/payment/paymentOptionScreen.dart';
import 'package:project/screens/widgets/constWidgets.dart';
import 'package:project/screens/widgets/header.dart';
import 'package:project/screens/widgets/slideTransitionWidget.dart';

class LearnMoreScreen extends StatefulWidget {
  @override
  _LearnMoreScreenState createState() => _LearnMoreScreenState();
}

class _LearnMoreScreenState extends State<LearnMoreScreen> {
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
                child: SlideTransitionAnimation(
                  // position: _offsetFloat,
                  state: Image.network(
                    "https://image.flaticon.com/icons/png/512/1698/1698591.png",
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SlideTransitionAnimation(
                // position: _offsetFloat,
                state: Text(
                  "Get moving faster with NOW",
                  style: theme.otpTextStyle1,
                  overflow: TextOverflow.visible,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SlideTransitionAnimation(
                // position: _offsetFloat,
                state: Text(
                  "For reliable trip, Now collects location data from the time you open the app until a trip ends. This improves pick-ups, support and more.",
                  style: theme.get_moving,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SlideTransitionAnimation(
                  //  position: _offsetFloat,
                  state: textButton(text: "Learn More")),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "btn1",
          backgroundColor: theme.color_black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentOptionScreen(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_forward,
            color: theme.white,
          ),
        ),
      ),
    );
  }
}
