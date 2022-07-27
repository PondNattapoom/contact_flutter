class Contact {
  final String? id;
  final String? name;
  final String? nickname;
  final String? social;
  final String? mobile;

  Contact({
    this.id,
    this.name,
    this.nickname,
    this.social,
    this.mobile,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      nickname: json['nickname'],
      social: json['social'],
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() => {
        "var_id": id,
        "var_name": name,
        "var_nick": nickname,
        "var_social": social,
        "var_mobile": mobile,
      };
}
