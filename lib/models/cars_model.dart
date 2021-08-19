class UserModel{
  String name;
  String email;
  String phone;
  String uId;
  bool isPhoneVerified;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.isPhoneVerified,
  });
  UserModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isPhoneVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap(){
    return{
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uId' : uId,
      'isEmailVerified' : isPhoneVerified,
    };
  }
}