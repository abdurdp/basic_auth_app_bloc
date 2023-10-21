class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final DateTime dob;
  final int divisionId;
  final int districtId;
  final String address;
  final String profilePhoto;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.divisionId,
    required this.districtId,
    required this.address,
    required this.profilePhoto,
  });

  // A factory constructor to create a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      dob: DateTime.parse(json['dob']),
      divisionId: json['division_id'],
      districtId: json['district_id'],
      address: json['address'],
      profilePhoto: json['profile_photo'],
    );
  }
}
