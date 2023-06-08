import 'dart:convert';

class UserResponse {
  final String status;
  final User user;
  final Authorization authorization;
  UserResponse({
    required this.status,
    required this.user,
    required this.authorization,
  });

  UserResponse copyWith({
    String? status,
    User? user,
    Authorization? authorization,
  }) {
    return UserResponse(
      status: status ?? this.status,
      user: user ?? this.user,
      authorization: authorization ?? this.authorization,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'user': user.toMap(),
      'authorization': authorization.toMap(),
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      status: map['status'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      authorization:
          Authorization.fromMap(map['authorization'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserResponse(status: $status, user: $user, authorization: $authorization)';

  @override
  bool operator ==(covariant UserResponse other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.user == user &&
        other.authorization == authorization;
  }

  @override
  int get hashCode => status.hashCode ^ user.hashCode ^ authorization.hashCode;
}

class User {
  final int id;
  final String name;
  final String email;
  final String role_id;
  final String created_at;
  final String updated_at;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role_id,
    required this.created_at,
    required this.updated_at,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? role_id,
    String? created_at,
    String? updated_at,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role_id: role_id ?? this.role_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'role_id': role_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      role_id: map['role_id'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.role_id == role_id &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        role_id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}

class Authorization {
  final String access_token;
  final String token_type;
  final int expires;
  Authorization({
    required this.access_token,
    required this.token_type,
    required this.expires,
  });

  Authorization copyWith({
    String? access_token,
    String? token_type,
    int? expires,
  }) {
    return Authorization(
      access_token: access_token ?? this.access_token,
      token_type: token_type ?? this.token_type,
      expires: expires ?? this.expires,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'token_type': token_type,
      'expires': expires,
    };
  }

  factory Authorization.fromMap(Map<String, dynamic> map) {
    return Authorization(
      access_token: map['access_token'] as String,
      token_type: map['token_type'] as String,
      expires: map['expires'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Authorization.fromJson(String source) =>
      Authorization.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Authorization(access_token: $access_token, token_type: $token_type, expires: $expires)';

  @override
  bool operator ==(covariant Authorization other) {
    if (identical(this, other)) return true;

    return other.access_token == access_token &&
        other.token_type == token_type &&
        other.expires == expires;
  }

  @override
  int get hashCode =>
      access_token.hashCode ^ token_type.hashCode ^ expires.hashCode;
}
