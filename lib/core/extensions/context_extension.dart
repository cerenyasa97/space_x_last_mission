import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double dynamicWidth(width) => width * this.width / 412;
  double dynamicHeight(height) => height * this.height / 870;

  double get textScale => MediaQuery.of(this).textScaleFactor;

  EdgeInsetsGeometry get photoEdgeInsets => EdgeInsets.all(this.dynamicWidth(10));

  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild!.context!.widget is! EditableText);
  }

  void closeKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}