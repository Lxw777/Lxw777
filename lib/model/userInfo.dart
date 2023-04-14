class UserInfo {
  String? avatar;
  String? id;
  String? uid;
  String? password;

  UserInfo({this.avatar, this.id, this.uid, this.password});

  UserInfo.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    id = json['id'];
    uid = json['uid'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['password'] = this.password;
    return data;
  }
}
