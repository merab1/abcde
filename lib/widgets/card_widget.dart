import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
///ფოტოების ვიჯეტი, რომელიც SharedPreferences-ით ინახავს ინფოს.
///სეთით ინახავს.
///ასევე სნეკბარი, რომ შეინახა სურათი, და
///ნავიგატორის პოპი, რომელიც დაჭერისას უკანა გვერდზე მაბრუნებს.
///ასევე გადაეცემა კონტექსი, რომ მიხვდეს სადაა ვიჯეტების ხეში და url, თუ
///რა უნდა დახატოს.

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