class ApiConstants {
  static const String baseUrl = 'https://pixabay.com/api';
  static const String apiKey = '31495794-c481ae15eb0ea1db9d3a6bf11';
  static const String perPage = 'per_page=80';
  static const String computerApiPath ='$baseUrl/?key=$apiKey&category=computer';
  static const String sportApiPath ='$baseUrl/?key=$apiKey&category=sports';
  static const String musicApiPath ='$baseUrl/?key=$apiKey&category=music';
  static const String foodApiPath ='$baseUrl/?key=$apiKey&category=food';
  static  String searchApiPath(String searchWord) =>'$baseUrl/?key=$apiKey&q=$searchWord';
}
