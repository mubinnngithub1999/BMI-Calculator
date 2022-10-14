import 'package:flutter/material.dart';

AppBar myOwnAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 21,
        fontWeight: FontWeight.w400,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black54),
  );
}
