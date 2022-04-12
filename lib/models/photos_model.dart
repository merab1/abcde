class PhotosModel {
  String url;

  PhotosModel({required this.url});

  factory PhotosModel.fromJson(Map<dynamic, dynamic> json) => PhotosModel(
        url: json['url'] as String,
      );
}
