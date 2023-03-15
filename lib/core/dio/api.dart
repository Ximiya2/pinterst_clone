
class Endpoints{


  static String baseUrl = 'https://api.unsplash.com/';

  static String token = 'Client-ID 6xqBxC8bqXAUlNJi195WJhHzgBqxPCXJZ6qHfTW-uHo';
  static String apiKey = '17d94b92-754f-46eb-99a0-65be65b5d18f';

  //photos
  static String getPhotos = '${baseUrl}photos?page=1&per_page=30&order_by=ASC';
  static String searchPhotos = '${baseUrl}search/photos';
  static String CollentionPhotos= '${baseUrl}collections';


}
