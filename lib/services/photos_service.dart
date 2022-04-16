import 'dart:convert';

import 'package:http/http.dart';
///აპი ქიი და აპის მისამართი
const apiKey = '26711456-bde74f403cb42e77029bc1678';
const appUrl = 'https://pixabay.com/api/';

class PhotosService {
  ///მოაქვს ინფორმაცია სერვერიდან. არის Future რადგან უნდა დაელოდოს
  ///მიღებას. ამ კლასის გამოყენებისას უნდა გადავცეთ url,
  Future getData(String url) async {
    print('Calling url: $url');
    ///აქ. ხდება ე.წ. url-ის გადაპარსვა http-ბიბლიოთეკის
    ///საშუალებით. უბრალოდ წინ არ უწერია და ზემოთაც as http-ს
    ///დაწერა აღარ გვჭირდება.
    final response = await get(Uri.parse(url));
    ///თუ ყველაფერი კარგადაა, response.body, ანუ json დააბრუნოს.
    if (response.statusCode == 200) {
      return response.body;
      ///თუ კავშირი გაწყდა, ეს დააბრუნოს, როგორც ორაქლის საიტზე ვნახე ეს კოდია.
    } else if (response.statusCode == 12163){
      print('The Internet connection has been lost.');
      return response.body;
    }
    ///სხვა შემთევევაში რა სტატუს კოდია ის დაწეროს.
    else {
      print(response.statusCode);
    }
  }
  ///თუ ძებნის უჯრა გვექნებოდა ამას მაშინ გამოვიყენებდით, ახლა null-ია
String? query;
  ///ფოტოების ლისტი
  List<PhotosModel> dataList = [];
  /// ამ მეთოდში ხდება url-ის აწყობა მისამართისა და აპი ქიის გამოყენებით
  Future<List<PhotosModel>> getPhotos() async {
    ///ამ ცვლადში ვინახავთ getData-ს დაბრუნებულ json-ს.
    final photosData = await getData('$appUrl?key=$apiKey&q=$query');
    ///აქ ხდება დეკოდირება json-დან.
    var data = json.decode(photosData);
    /// აქ ვინახავთ hits ლისტის ელემენტებს. ასე ჰქვია აპიში.
    var items = data["hits"];
    ///გადავატარებთ ციკლს და ჩავყრით dataList-ში იმ ელემენტებს,
    ///რომელიც მოდელში გვაქვს გასნაზღვრული.
    items.forEach((element) {
      dataList.add(PhotosModel.fromJson(element));
    });

    print('this is photos data: $photosData');
    return dataList;
    ///ეს მეთოდი აბრუნებს ამ ლისტს.
  }
}

class PhotosModel {
  String webformatURL;

  PhotosModel({required this.webformatURL});
///factory კონსტრუქტორი, რათა გადავიყვანოთ Json Map ჩვენთვის სასურველ ფორმატად
  ///ამ კონსტრუქტორის პლიუსი ისაა რომ ახალ ინსტანსს არ ჰქმნის და მალავს კლასის
  ///არქიტექტურას
  factory PhotosModel.fromJson(Map<dynamic, dynamic> json) =>
      _commentFromJson(json);
///Map, რომელიც მუშაობს key, value პრინციპით. ამ შემთხვევაში ორივე dynamic არის,
  ///ანუ ნებისმიერი ტიპის მიღება შეუძლია. ზოგადად არაა რეკომენდებული დინამიკურის
  ///გამოყენება, მაგრამ როცა არ ვიცით სერვერი რა ტიპს დაგვიბრუნებს, მაშინ კარგია რადგან
  ///ყველა ტიპი მივიღოთ
  Map<dynamic, dynamic> toJson() => photosModelToJson(this);
}
///აქ webformatURL აქ ვინახავთ webformatURL Json-დან ამ key-ს ფაილს.
PhotosModel _commentFromJson(Map<dynamic, dynamic> json) {
  return PhotosModel(
    webformatURL: json['webformatURL'],
  );
}

Map<dynamic, dynamic> photosModelToJson(PhotosModel instance) =>
    <dynamic, dynamic>{
      'webformatURL': instance.webformatURL,
    };

///toJson() აქ ყველაფერი შეტრიალებულადაა. რომ გვინდოდეს სერვერზე ინფორმაციის
///წაღება ამ მეთოდით გავაJson-ებდით, თუმცა ახლა მხოლოდ ვკითხულობთ.