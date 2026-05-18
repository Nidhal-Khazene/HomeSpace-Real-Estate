import 'package:flutter/material.dart';

class ListTileModel {
  final String? leading, title, subtitle, trailing;
  final Widget? leadingWidget, trailingWidget;

  ListTileModel({
    this.leadingWidget,
    this.trailingWidget,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  });
}
