import 'package:abcde/widgets/dialog_widget.dart';
import 'package:abcde/authentication_screen/pages/photos_page.dart';
import 'package:abcde/services/photos_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AfterAuth extends StatefulWidget {
  AfterAuth({Key? key}) : super(key: key);
  static const String pathId = 'Welcome Page';

  @override
  State<AfterAuth> createState() => _AfterAuthState();
}

class _AfterAuthState extends State<AfterAuth> {
  String welcomeScreen = 'Welcome to the club';

  ///ეს მეთოდი ანდროიდის onCreate-ის ტოლფასია. ეფლზე არ მახსოვს რა ჰქვია.
  ///ანუ აქ იტვირთება ის ინფო, რაც გვჭირდება რომ აპლიკაციის გაშვების დროს უკვე ჩატვირთული
  ///იყოს.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///ამ მეთოდს ვდებთ აქ რომ ჩატვირთვისას უკვე განახლებული დამხვდეს.
    internalMemory();
    //final prefs = await SharedPreferences.getInstance();
  }
///აქ ვიჯეტები, ღრმა ფილოსოფიური მგონი არაფერი :D და Drawer.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text('Welcome'),
            ),
            ListTile(
              title: const Text(
                'Bonjour',
              ),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Bonjour';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Hello'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Hello';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Guten Tag'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Guten Tag';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Au Revoir'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Au Revoir';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chao Bambino'),
              onTap: () {
                setState(() {
                  welcomeScreen = 'Chao Bambino';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(address),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 50,
              color: const Color.fromARGB(200, 230, 242, 255),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 11,
                ),
                Text(
                  welcomeScreen,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 20, 60, 120),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () async {
          await Navigator.pushNamed(context, PhotosPage.pathId);
          ///აქ გამოვიყენოთ ეს მეთოდი რომ უკან დაბრუნებისას, გვერდი განახლებული
          ///დამხვდეს
          internalMemory();
          PhotosService photosService = PhotosService();
          // String url =
          ///აქ თუ ინფოს ვერ წამოიღებს, ცალკე გატანილი ალერთ ბოქსი რომ ამოხტეს.
          var data = await photosService.getPhotos();
          if (data == null) {
            return customAlertDialog(context);
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  String address = '';
///ეს მეთოდია იმისთვის რომ shared preferences-ით წამოვიღოთ ინფო,
  ///ამ შემთხვევაში სურათის მისამართი - სტრინგის ტიპის. და ვიყენებთ setState მეთოდს
  ///რომ განაახლოს UI.
  internalMemory() async {
    final prefs = await SharedPreferences.getInstance();
    address = await prefs.getString('urlAddress')!;
    setState(() {});
  }
}
