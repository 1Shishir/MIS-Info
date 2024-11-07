class Person {
  final String name;
  final String designation;
  final String mobile;
  final String email;

  Person({
    required this.name,
    required this.designation,
    required this.mobile,
    required this.email,
  });

  factory Person.fromJson(Map<dynamic, dynamic> json) {
    return Person(
      name: json['name'] ?? '',
      designation: json['designation'] ?? '',
      mobile: json['mobile'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
