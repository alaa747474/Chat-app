
class UserModel {
  final String name;
  final String email;
  final String profilePic;
  final String phoneNumber;

  UserModel(this.name, this.email, this.profilePic, this.phoneNumber);


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '',
      map['email'] ?? '',
      map['profilePic'] ?? '',
      map['phoneNumber'] ?? '',
    );
  }

}
