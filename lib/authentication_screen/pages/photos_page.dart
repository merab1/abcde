import 'dart:convert';

import 'package:abcde/services/photos_model.dart';
import 'package:abcde/services/photos_service.dart';
import 'package:abcde/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
   PhotosPage({Key? key}) : super(key: key);
  static const String pathId = 'Photos page';
  List<PhotosModel> photosList = [];


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
    final photoItem = snapshot.data[index].previewURL;
    print('photoItem is $photoItem');
    return photoCard(photoItem);
  }

  Widget _buildList(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    var values = snapshot.data;
    return ListView.builder(
    //  itemCount: snapshot.length,
      itemBuilder: (context, index) {
        return _buildListItem(context, snapshot, index);
      },
    );
/*    return ListView(
      children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
    );*/
  }
//PhotosModel photosModel = PhotosModel();
PhotosService photosService = PhotosService();
  Widget _getProductTypeList() {
    return Expanded(
      child: FutureBuilder<PhotosModel>(
        future: photosService.getPhotos(),
        builder: (context, snapshot) {
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

/*  Future<PhotosModel> getPhotosData(String query) async {
    final photosJson = await PhotosService().getPhotos();
    final photosMap = json.decode(photosJson.toString());
    return PhotosModel.fromJson(photosMap);
  }*/
}
