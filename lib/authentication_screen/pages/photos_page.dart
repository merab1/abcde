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
/// აქაც გაშვებისთანავა, ინიტში ვიძახებთ ფოტოების კლასს, რომ მაშინცე დაიყოს ჩატვირთვა
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
          _getPhotoList(),
        ]),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, AsyncSnapshot<dynamic> snapshot, int index) {
    final photoItem = snapshot.data[index].webformatURL;
    print('photoItem is $photoItem');
    return photoCard(context, photoItem);
  }

  Widget _buildList(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    var values = snapshot.data;
    return ListView.builder(
      itemCount: snapshot.hasData ? snapshot.data.length : 0,
      itemBuilder: (context, index) {
        return _buildListItem(context, snapshot, index);
      },
    );
  }

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


