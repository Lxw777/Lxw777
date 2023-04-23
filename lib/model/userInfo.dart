// class UserInfo {
//   String? avatar;
//   String? id;
//   String? uid;
//   String? password;

//   UserInfo({this.avatar, this.id, this.uid, this.password});

//   UserInfo.fromJson(Map<String, dynamic> json) {
//     avatar = json['avatar'];
//     id = json['id'];
//     uid = json['uid'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['avatar'] = this.avatar;
//     data['id'] = this.id;
//     data['uid'] = this.uid;
//     data['password'] = this.password;
//     return data;
//   }
// }
class UserInfo {
  String? avatar;
  String? id;
  String? uid;
  String? password;
  String? qq;
  String? phone;

  UserInfo(
      {this.avatar,
      this.id,
      this.uid,
      this.password,
      this.qq = "000000000",
      this.phone = "00000000"});

  UserInfo.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    id = json['id'];
    uid = json['uid'];
    password = json['password'];
    qq = json['qq'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['password'] = this.password;
    data['qq'] = this.qq;
    data['phone'] = this.phone;
    return data;
  }
}
