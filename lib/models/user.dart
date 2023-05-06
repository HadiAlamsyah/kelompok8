class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? profilePhoto;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profilePhoto,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      name: map["name"],
      username: map["username"],
      email: map["email"],
      profilePhoto: map["profile_photo"],
      phoneNumber: map["phone_number"],
    );
  }

  factory User.dummy() {
    return User(
      id: 001,
      name: "KEL 8",
      username: "kel 8",
      email: "syahrilhilman30@gmail.com",
      profilePhoto:
          "https://i.buddyku.id/ugc/2022/11/03/null/null-63632cadd40c2e9647415f50.jpeg",
      phoneNumber: "tos ah",
    );
  }
}
