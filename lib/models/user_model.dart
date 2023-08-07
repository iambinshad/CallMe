class UserModel{
  final String email;
  final String userName;
  final String name;

  UserModel({required this.email, required this.userName, required this.name});

  factory UserModel.fromJson(Map<String, dynamic>json) =>UserModel(email: json['email'], userName: json['username'], name: json['name']);
  Map<String, dynamic>toJson()=>{
    'email':email,
    'name':name,
    'username':userName,
  };
}