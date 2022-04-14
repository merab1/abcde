class PhotosModel {
  String previewURL;

  PhotosModel({required this.previewURL});

/*  factory PhotosModel.fromJson(Map<dynamic, dynamic> json) => PhotosModel(
        previewURL: json['previewURL'] as String,
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'previewURL': previewURL};
  }*/

/*  @override
  String toString() {
    return 'PhotosModel{url: $previewURL}';
  }*/
/*factory PhotosModel.fromJson(Map<String, dynamic> json) {
  return PhotosModel(url: json['url'] as String);
}*/

  factory PhotosModel.fromJson(Map<dynamic, dynamic> json) =>
      _commentFromJson(json);

  Map<dynamic, dynamic> toJson() => photosModelToJson(this);
}

PhotosModel _commentFromJson(Map<dynamic, dynamic> json) {
  return PhotosModel(
    previewURL: json['previewURL'],
  );
}

Map<dynamic, dynamic> photosModelToJson(PhotosModel instance) => <dynamic, dynamic>{
  'previewURL': instance.previewURL,
};
