import 'package:flutter/material.dart';

Widget photoCard(String url) {
  return Card(
    child: Image(
      image: NetworkImage(url),
    ),
  );
}