import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);
  static const String pathId = 'Photos page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photos'),),
    );
  }
  Widget myCard(BuildContext context) {
    return Card(
      //child: ,
    );
  }
}
