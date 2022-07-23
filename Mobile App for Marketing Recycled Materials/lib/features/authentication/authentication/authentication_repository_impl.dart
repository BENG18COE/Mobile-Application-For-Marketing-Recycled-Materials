import 'package:firebase_auth/firebase_auth.dart';
import 'package:trial/features/authentication/authentication/authenticate_service.dart';
import 'package:trial/features/database/database_service.dart';

import '../../../models/user_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationService service = AuthenticationService();
  DatabaseService dbService = DatabaseService();

  @override
  Stream<UserModel> getCurrentUser() {
    return service.retrieveCurrentUser();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    try {
      return service.signUp(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signIn(UserModel user) {
    try {
      return service.signIn(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }

  @override
  Future<String?> retrieveUserName(UserModel user) {
    return dbService.retrieveUserName(user);
  }

  @override
  Future<String?> retrieveUserCategory(UserModel user) {
    // TODO: implement retrieveUserCategory
    return dbService.retrieveUserCategory(user);
  }

  @override
  Future<String?> retrieveUserEmail(UserModel user) {
    // TODO: implement retrieveUserEmail
    return dbService.retrieveUserEmail(user);
  }
}

abstract class AuthenticationRepository {
  Stream<UserModel> getCurrentUser();
  Future<UserCredential?> signUp(UserModel user);
  Future<UserCredential?> signIn(UserModel user);
  Future<void> signOut();
  Future<String?> retrieveUserName(UserModel user);
  //added code
  Future<String?> retrieveUserCategory(UserModel user);
  Future<String?> retrieveUserEmail(UserModel user);
}
