class PhotosModel {
  String previewURL;

  PhotosModel({required this.previewURL});

  factory PhotosModel.fromJson(Map<dynamic, dynamic> json) => PhotosModel(
        previewURL: json['previewURL'] as String,
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'previewURL': previewURL};
  }

/*  @override
  String toString() {
    return 'PhotosModel{url: $previewURL}';
  }*/
/*factory PhotosModel.fromJson(Map<String, dynamic> json) {
  return PhotosModel(url: json['url'] as String);
}*/
}
