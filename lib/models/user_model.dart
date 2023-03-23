class UserModel {
  final String firstname;
  final String lastname;
  final String password;
  final String email;
  final String uid;
  final String profilePic;
  final bool isOnline;
  final String phoneNumber;
  final List<String> groupId;
  final String bio;
  final List followers;
  final List following;

  const UserModel(
      {required this.firstname,
      required this.lastname,
      required this.password,
      required this.email,
      required this.uid,
      required this.profilePic,
      required this.isOnline,
      required this.phoneNumber,
      required this.groupId,
      required this.bio,
      required this.followers,
      required this.following});

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'password': password,
      'lastname': lastname,
      'email': email,
      'uid': uid,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
      "bio": bio,
      "followers": followers,
      "following": following,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      profilePic: map['profilePic'] ?? '',
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      groupId: List<String>.from(map['groupId']),
      bio: map["bio"],
      followers: map["followers"],
      following: map["following"],
    );
  }
}
