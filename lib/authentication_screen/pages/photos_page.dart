import 'dart:convert';

import 'package:abcde/services/photos_model.dart';
import 'package:abcde/services/photos_service.dart';
import 'package:abcde/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
   PhotosPage({Key? key}) : super(key: key);
  static const String pathId = 'Photos page';

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  PhotosService photosService = PhotosService();
  @override
  void initState() {
    // TODO: implement initState
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
