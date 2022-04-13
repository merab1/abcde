import 'package:abcde/services/photos_model.dart';
import 'package:abcde/services/photos_service.dart';
import 'package:abcde/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);
  static const String pathId = 'Photos page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _getProductTypeList(photosData),
        ]),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, List<PhotosModel> snapshot, int index) {
    final productType = snapshot[index].url;
    return photoCard(productType);
  }

  Widget _buildList(BuildContext context, List<PhotosModel>? snapshot) {
    return ListView.builder(
      itemCount: snapshot!.length,
      itemBuilder: (context, index) {
        return _buildListItem(context, snapshot, index);
      },
    );
/*    return ListView(
      children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
    );*/
  }

  Widget _getProductTypeList(PhotosService photosService) {
    return Expanded(
      child: FutureBuilder<PhotosModel>(
        future: photosService.getPhotos(query, from, to),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
          return _buildList(context, snapshot.data!.docs);
        },
      ),
    );
  }
}
