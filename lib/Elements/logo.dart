// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 170.0,
        width: 320,
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/googlelogo.png"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
