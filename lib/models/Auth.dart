class Auth {
  final int id;
  final String accessToken;
  final String refreshToken;
  final String ownerType;
  final String expiresAt;

  Auth({this.id, this.accessToken, this.refreshToken, this.ownerType, this.expiresAt});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      id: json['user_id'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      ownerType: json['owner_type'],
      expiresAt: json['expires_at'],
    );
  }

  String toStringId() {
    return id.toString();
  }
}