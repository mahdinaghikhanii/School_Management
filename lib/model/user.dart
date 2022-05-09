class User {
  int? id;
  String? name;
  String? family;
  String? mobile;
  String? email;
  int? type;
  String? token;
  bool? active;
  String? lastlogin;

  User(
      {this.id,
      this.name,
      this.family,
      this.mobile,
      this.email,
      this.type,
      this.token,
      this.active,
      this.lastlogin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
    active = json['active'];
    lastlogin = json['lastlogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id as int;
    data['name'] = name as String;
    data['family'] = family as String;
    data['mobile'] = mobile as String;
    data['email'] = email as String;
    data['type'] = type as int;
    data['token'] = token as String;
    data['active'] = active as bool;
    data['lastlogin'] = lastlogin as String;
    return data;
  }
}
