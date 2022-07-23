part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  final String? displayName;
  final String? userCategory;
  final String? userEmail;

  const AuthenticationSuccess(
      {this.displayName, this.userCategory, this.userEmail});

  @override
  List<Object?> get props => [displayName, userCategory, userEmail];
}

class AuthenticationFailure extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
