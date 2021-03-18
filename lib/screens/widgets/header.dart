import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/widgets/iinkwell.dart';

class Header extends StatefulWidget {
  final String title;
  final bool nomenu;
  final Function onMenuClick;
  Color color;
  List<Widget> action;
  Header({this.onMenuClick, this.nomenu, this.title, this.color, this.action});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var _style = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w300,
    color: theme.color_black,
    fontSize: 20,
  );

  _onBackClick() {
    print("back form basket");
    Navigator.pop(context);
  }

  _onMenuClick() {
    print("User click menu button");
    if (widget.onMenuClick != null) widget.onMenuClick();
  }

  @override
  Widget build(BuildContext context) {
    var _box = BoxDecoration(
      color: widget.color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(3, 3),
        ),
      ],
    );
    String _title = "";
    if (widget.title != null) _title = widget.title;

    Widget _menu = Container();
    // Widget _menu = IInkWell(
    //   child: _iconMenuWidget(),
    //   onPress: _onMenuClick,
    // );
    if (widget.nomenu)
      _menu = IInkWell(
        child: _iconBackWidget(),
        onPress: _onBackClick,
      );
    return Container(
      height: 50,
      // decoration: _box,
      child: Row(
        children: [
          _menu,
          Expanded(
            flex: 0,
            child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  _title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: _style,
                )),
          ),
          // SizedBox(
          //   width: 150,
          // ),
          widget.action == null
              ? Expanded(child: Container())
              : Row(
                  children: widget.action,
                ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  _iconBackWidget() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: UnconstrainedBox(
        child: Container(
          height: 25,
          width: 25,
          child: Icon(
            Icons.arrow_back,
            color: theme.color_black,
            size: 25,
          ),
        ),
      ),
    );
  }

  _iconMenuWidget() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: UnconstrainedBox(
        child: Container(
          height: 25,
          width: 25,
          child: Icon(
            Icons.menu,
            color: theme.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
