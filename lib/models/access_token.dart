
class AccessToken {
  final String tokenType;
  final int expiresIn;
  final String accessToken;
  final String refreshToken;

  AccessToken({required this.tokenType, required this.expiresIn, required this.accessToken, required this.refreshToken});

  factory AccessToken.fromJson(Map <String, dynamic> json) {
    return AccessToken(
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token']
    );
  }

}