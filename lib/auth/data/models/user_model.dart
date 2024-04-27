
class UserModel {
  final String name;
  final String email;
  final String id;
  UserModel( {required this.id,required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
          name: json["name"],
          email: json["email"],
           id: json["id"],
      );

  Map<String,dynamic> toJson() =>{
    "name":name,
    "email":email,
    "id":id,
  };
}
