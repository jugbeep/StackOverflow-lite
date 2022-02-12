import 'package:firebase_auth/firebase_auth.dart';
import 'package:stack_overflow_lite/modules/login/errors/errors.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

abstract class LoginDatasource {
  Future<UserModel> loginEmail(
      {required String email, required String password});

  Future<UserModel> currentUser();
  Future<void> logout();
}

class FirebaseDatasourceImpl implements LoginDatasource {
  final FirebaseAuth auth;

  FirebaseDatasourceImpl(this.auth);

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    final UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    final user = result.user;

    return UserModel(email: user!.email!, uid: user.uid);
  }

  @override
  Future<UserModel> currentUser() async {
    var user = auth.currentUser;

    if (user == null) throw ErrorGetLoggedUser(message: 'No current user');

    return UserModel(email: user.email!, uid: user.uid);
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }
}
