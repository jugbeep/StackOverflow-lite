// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginSignupController on _LoginSignupControllerBase, Store {
  Computed<LoginCredential>? _$credentialComputed;

  @override
  LoginCredential get credential => (_$credentialComputed ??=
          Computed<LoginCredential>(() => super.credential,
              name: '_LoginSignupControllerBase.credential'))
      .value;

  final _$loadingAtom = Atom(name: '_LoginSignupControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginSignupControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginSignupControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_LoginSignupControllerBaseActionController =
      ActionController(name: '_LoginSignupControllerBase');

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_LoginSignupControllerBaseActionController
        .startAction(name: '_LoginSignupControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_LoginSignupControllerBaseActionController
        .startAction(name: '_LoginSignupControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
email: ${email},
password: ${password},
credential: ${credential}
    ''';
  }
}
