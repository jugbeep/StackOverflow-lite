import '../models/user.dart';
import 'package:http/http.dart' as http;

abstract class LoginDatasource {
  Future<UserModel> loginEmail(
      {required String email, required String password});
}

class FirebaseDatasourceImpl implements LoginDatasource {
  FirebaseDatasourceImpl();

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    final result = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBXGhQ2MWK3ADCN0uOQkMuaLRAlFiaoSuM'),
        body: {'email': email, 'password': password});

    print(result);
    final user = result;
    return UserModel(
      name: 'John',
      email: 'john@fake.com',
    );
  }
}
