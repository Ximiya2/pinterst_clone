class PostModel {

  String image;
  String? like;
  String? title;

  PostModel({required this.image,  this.like, this.title});
}

List<PostModel> postList = [
  PostModel(image: 'assets/ph1.jpg', like: '7,7 тыс.',title: 'Happy Birthday'),
  PostModel(image: 'assets/ph2.jpg', ),
  PostModel(image: 'assets/Qor.jpg', like: '7,7 тыс.'),
  PostModel(image: 'assets/Crismas.jpg', like: '7,7 тыс.'),
  PostModel(image: 'assets/card2.jpg', title: 'Hello'),
  PostModel(image: 'assets/flag_UZB.jpg', like: '7,7 тыс.',title: 'Happy Birthday'),
  PostModel(image: 'assets/Crismas.jpg', like: '7,7 тыс.'),
  PostModel(image: 'assets/card2.jpg', title: 'Hello'),
  PostModel(image: 'assets/flag_UZB.jpg', like: '7,7 тыс.',title: 'Happy Birthday'),
];