import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  final String apiKey;
  final String imgUrl;
  final String apiUrl;

  AppConfig({
    required this.apiKey,
    required this.imgUrl,
    required this.apiUrl,
  });

  factory AppConfig.getConfig() {
    return AppConfig(
      apiKey: dotenv.get('API_KEY'),
      imgUrl: dotenv.get('IMG_URL'),
      apiUrl: dotenv.get('URL'),
    );
  }
}
