class User {
  late final int id;
  late final String accessToken;
  late final String refreshToken;

  User({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  User.fromMap(Map<String, dynamic> result)
      : id = result['id'],
        accessToken = result['accessToken'],
        refreshToken = result['refreshToken'];
  // @override
  // String toString() {
  //   return 'User{id: $id, accessToken: $accessToken, refreshToken: $refreshToken}';
  // }
}

class BoolCom {
  late final int id;
  late final int boole;

  BoolCom({
    required this.id,
    required this.boole,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'boole': boole,
    };
  }

  BoolCom.fromMap(Map<String, dynamic> result)
      : id = result['id'],
        boole = result['boole'];
}
