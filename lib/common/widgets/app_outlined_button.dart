import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AppOutlinedButton({required Widget widget, required VoidCallback onPressed}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.grey.shade400),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    ),
  );
}
