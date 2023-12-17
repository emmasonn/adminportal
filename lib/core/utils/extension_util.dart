import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  //returns device width
  double get widthPx => MediaQuery.of(this).size.width;
  //returns device height
  double get heiightPx => MediaQuery.of(this).size.height;
  
}
