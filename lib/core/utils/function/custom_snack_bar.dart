import 'package:flutter/material.dart';

void showCustomSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
