import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trial/features/authentication/authentication/authentication_repository_impl.dart';
import 'package:trial/models/models.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AuthenticationStarted) {
        UserModel user = await _authenticationRepository.getCurrentUser().first;
        if (user.uid != "uid") {
          String? userCategory =
              await _authenticationRepository.retrieveUserCategory(user);
          String? userEmail =
              await _authenticationRepository.retrieveUserEmail(user);
          String? displayName =
              await _authenticationRepository.retrieveUserName(user);
          emit(
            AuthenticationSuccess(
                displayName: displayName,
                userCategory: userCategory,
                userEmail: userEmail),
          );
        } else {
          emit(AuthenticationFailure());
        }
      } else if (event is AuthenticationSignedOut) {
        await _authenticationRepository.signOut();
        emit(AuthenticationFailure());
      }
    });
  }
}
