class UserModel {
  final String uid;
  final String? name, email;

  UserModel({required this.uid, required this.name, required this.email});
  factory UserModel.fromJson(jsonData) {
    return UserModel(
      uid: jsonData["uid"],
      name: jsonData["name"],
      email: jsonData["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"uid": uid, "name": name, "email": email};
  }
}
