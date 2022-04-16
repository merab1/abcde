import 'package:flutter/material.dart';

import '../../services/photos_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/card_widget.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);
  static const String pathId = 'Photos page';

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  PhotosService photosService = PhotosService();

/// აქაც გაშვებისთანავე, ინიტში ვიძახებთ ფოტოების კლასს, რომ მაშინვე დაიწყოს ჩატვირთვა
  @override
  void initState() {
    super.initState();
    photosService.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          ///ფოტოლისტები ჩამიყაროს ამ სვეტში
          _getPhotoList(),
        ]),
      ),
    );
  }
  /// თითოეული ელემენტი, რომელსაც გადაეცემა ასინქსნეფშოთი, რომელიც გამოიყენება FutureBuilder
  /// და StreamBuilder-ის მიერ უახლესი ობიექტის შესაქმნელად, ამ შემთხვევაში FutureBuilder, და
  /// ჩვეულებრივი ინტი, რის მიხედვითაც უნდა ჩატვირთოს ამ ელემენტში სურათი.
  /// photoItem ინახავს სნეფშოთის ელემენტის ინდექსის webformatURL key-ს value-ს,
  /// რომელიც კონტექსტთან ერთად გადაეცემა ფოტოქარდს.
  Widget _buildListItem(
      BuildContext context, AsyncSnapshot<dynamic> snapshot, int index) {
    final photoItem = snapshot.data[index].webformatURL;
    print('photoItem is $photoItem');
    return photoCard(context, photoItem);
  }

  ///აქ იქმნება თვითონ ლისტი სურათების. თუ სნაფშოთში არის რამე,
  ///მითხარი რამდენი ობიექტია, თუ ადა და ესე იგი0-ია.
  ///values-ს აღარ ვიყენებ, პირდაპირ snapshot.data-ს.
  ///და აბრუნებს ბილდლისტაითემს თავისი პარამეტრებიანა.
  ///ჰოო მართლა, ListView.builder-ის მაგივრად ჩვეულებრივი ლისტის
  ///გამოყენებაც შეიძლებოდა მაგრამ ეს სჯობს. ის მთლიანად ჰქმნის ლისტს და
  ///ეს ეტაპობრივად, როცა ელემენტი თავდება მაშინ ამატებს ახალს.
  Widget _buildList(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    var values = snapshot.data;
    return ListView.builder(
      itemCount: snapshot.hasData ? snapshot.data.length : 0,
      itemBuilder: (context, index) {
        return _buildListItem(context, snapshot, index);
      },
    );
  }
/// ეს კი Expanded-ში ქმნის FutureBuilder ობიექტს, რომელიც იქმნება Future-ში მიღებული ინფორმაციით.
  /// future-ში გადაეცემა მისამართი photosService.getPhotos()-დან
  /// builder კი ქმნის ობიექტს კონტექსტისა და სნეფშოთის დახმარებით.
  /// ეს მეთოდი აბრუნებს ბილდლისტს და გადაეცემა მთავარ build მეთოდს ლისტის ეკრანზე გამოსატანად
  Widget _getPhotoList() {
    return Expanded(
      child: FutureBuilder(
        future: photosService.getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          ///თუ ელოდება, პროგრესბარი, თუ არა და ბილდლისტი ჩატვირთოს
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
          return _buildList(context, snapshot);
        },
      ),
    );
  }
}


