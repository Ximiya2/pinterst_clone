class UserModel {

  String name;
  String? userImage;
  String email;

  UserModel({this.userImage,  required this.name, required this.email});
}

var User = UserModel(
    userImage: 'assets/Crismas.jpg',
    name: 'Asadbek Urazaliev',
    email: 'asadbekurazaluev@gmail.com'
);
