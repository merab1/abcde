import 'package:flutter/material.dart';

Widget myCard(String url) {
  return Card(
    child: Image(
      image: NetworkImage(url),
    ),
  );
}