import 'package:flutter/material.dart';

import '../../services/photos_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);
  static const String pathId = 'Photos page';

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  PhotosService photosService = PhotosService();

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
          _getProductTypeList(),
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

  Widget _getProductTypeList() {
    return Expanded(
      child: FutureBuilder(
        future: photosService.getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
