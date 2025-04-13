class UserModel{
  final String? id;
  final String? profilepic;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final DateTime? creationDate;


  const UserModel({
    this.id,
    this.profilepic,
    this.creationDate,
    required this.email,
    required this.phoneNo,
    required this.fullName,
    required this.password,
  });

  toJson(){
    return{
      "id" : id,
      "fullName" : fullName,
      "email" :  email,
      "profilepic" : profilepic,
      "phoneNo" : phoneNo,
      "password" : password,
      //"creationDate": creationDate,
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      profilepic: json['profilepic'] as String,
      phoneNo: json['phoneNo'] as String,
      password: json['password'] as String,
      //creationDate: DateTime.parse(json['creationTime'] as String) ,

    );
  }

  // factory UserModel.fromJsonTwo(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json['id'] as String,
  //     fullName: json['fullName'] as String,
  //     email: json['email'] as String,
  //     profilepic: json['profilepic'] as String,
  //     phoneNo: json['phoneNo'] as String,
  //     password: json['password'] as String,
  //     creationDate: DateTime.parse(json['creationDate'] as String) ,
  //
  //   );
  // }
  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  //   final data = document.data()!;
  //   return UserModel(
  //     id: document.id,
  //     profilepic: data["profilepic"],
  //     email: data["email"],
  //     phoneNo: data["phoneNo"],
  //     fullName: data["fullName"],
  //     password: data["password"],
  //     //creationDate: (data['creationDate'] as Timestamp).toDate(),
  //   );
  // }
  //
  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     id: map['id'] as String?,
  //     profilepic: map['profilepic'] as String?,
  //     fullName: map['fullName'] as String,
  //     email: map['email'] as String,
  //     phoneNo: map['phoneNo'] as String,
  //     password: map['password'] as String,
  //     //creationDate: (map['creationDate'] as Timestamp).toDate(),
  //   );
  // }

}