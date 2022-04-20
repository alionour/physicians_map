import 'package:flutter/foundation.dart';

@immutable
class AuthenticationModel {
  final String? id;
  final String? username;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final DateTime? joinedAt;
  final List<dynamic>? roles;
  final String? accessToken;

  const AuthenticationModel({
    this.id,
    this.username,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.joinedAt,
    this.roles,
    this.accessToken,
  });

  @override
  String toString() {
    return 'User(id: $id, username: $username, firstName: $firstName,middleName:$middleName , lastName: $lastName, email: $email, joinedAt: $joinedAt, roles: $roles, accessToken: $accessToken)';
  }

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        id: json['id'] as String?,
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        middleName: json['middleName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        joinedAt: (json['joinedAt'] != null)
            ? DateTime.tryParse(json['joinedAt'])
            : null,
        roles: json['roles'] as List<dynamic>?,
        accessToken: json['accessToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'email': email,
        'joinedAt': joinedAt.toString(),
        'roles': roles,
        'accessToken': accessToken,
      };

  AuthenticationModel copyWith({
    String? id,
    String? username,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    DateTime? joinedAt,
    List<dynamic>? roles,
    String? accessToken,
  }) {
    return AuthenticationModel(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.lastName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      joinedAt: joinedAt ?? this.joinedAt,
      roles: roles ?? this.roles,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AuthenticationModel) return false;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      firstName.hashCode ^
      middleName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      joinedAt.hashCode ^
      roles.hashCode ^
      accessToken.hashCode;
}
