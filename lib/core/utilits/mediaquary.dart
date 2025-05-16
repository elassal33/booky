

import 'package:flutter/material.dart';
class SizeConfig {
 static  late  double width;
 static late  double height;




 static  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

  }
}
