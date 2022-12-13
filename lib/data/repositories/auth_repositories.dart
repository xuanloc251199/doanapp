import 'package:daoan6/data/request/auth_request.dart';
import 'package:daoan6/models/user.dart';

abstract class AuthRepositories {
  Future<User> onAuth(AuthRequest request, String url);
}
