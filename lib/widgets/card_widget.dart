import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget photoCard(BuildContext context, String url) {
  return GestureDetector(
    onTap: () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('urlAddress', url);
      const snackBar = SnackBar(content: Text('You saved image'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context, prefs.getString('urlAddress'));
    },
    child: Expanded(
      child: Column(
        children: [
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(url),
              ),
            ),
          ),
          const SizedBox(height: 15,),
        ],
      ),
    ),
  );
}