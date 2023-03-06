
class UserModel {
  final String name;
  final String email;
  final String profilePic;
  final String phoneNumber;
  final String uid;
  UserModel(this.name, this.email, this.profilePic, this.phoneNumber,this.uid);


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'uid':uid
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '',
      map['email'] ?? '',
      map['profilePic'] ?? '',
      map['phoneNumber'] ?? '',
      map['uid']??''
    );
  }

}
