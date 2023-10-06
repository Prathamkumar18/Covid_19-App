class Donor {
  final String name;
  final int age;
  final String bloodGroup;
  final String address;
  final String email;
  final String phoneNumber;

  Donor({
    required this.name,
    required this.age,
    required this.bloodGroup,
    required this.address,
    required this.email,
    required this.phoneNumber,
  });

  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      name: json['name'],
      age: json['age'],
      bloodGroup: json['bloodGroup'],
      address: json['address'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}