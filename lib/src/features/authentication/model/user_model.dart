class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? yearOfStudy;
  String? course;
  String? idNumber;
  String? studentId;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.yearOfStudy,
    this.course,
    this.idNumber,
    this.studentId
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'yearOfStudy': yearOfStudy,
      'course': course,
      'idNumber':idNumber,
      'studentId':studentId
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      yearOfStudy: json['yearOfStudy'],
      course: json['course'],
      idNumber:json['idNumber'],
      studentId:json['studentId']
    );
  }
}
