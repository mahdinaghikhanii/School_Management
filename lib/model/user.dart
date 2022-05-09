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
      {required this.id,
      required this.name,
      required this.family,
      required this.mobile,
      this.email,
      required this.type,
      this.token,
      required this.active,
      this.lastlogin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
    active = json['active'] == 1;
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
    data['active'] = active as bool ? 1 : 0;
    data['lastlogin'] = lastlogin as String;
    return data;
  }

  String get typeName => type == 1
      ? 'Admin'
      : type == 2
          ? 'Teacher'
          : 'Student';
}
