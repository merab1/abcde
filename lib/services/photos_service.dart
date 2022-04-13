import 'package:abcde/services/photos_model.dart';
import 'package:http/http.dart';

const MY_API_KEY = '26711456-bde74f403cb42e77029bc1678';
const appUrl = 'https://pixabay.com/api/';

class PhotosService {
  Future getData(String url) async {
    print('Calling url: $url');
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<PhotosModel> getPhotos({String? query}) async {
    final photosData = await getData(
        '$appUrl?&key=$MY_API_KEY&q=$query');
    print('this is photos data: $photosData');
    return photosData;

  }
}