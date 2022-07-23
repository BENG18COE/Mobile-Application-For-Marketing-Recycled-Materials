// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:trial/cubit/cubits.dart';
// import 'package:trial/repositories/repositories.dart';
//
// part 'login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit(this._authRepository) : super(LoginState.initial());
//
//   final AuthRepository _authRepository;
//
//   void emailChanged(String value) {
//     emit(
//       state.copyWith(
//         email: value,
//         status: LoginStatus.initial,
//       ),
//     );
//   }
//
//   void passwordChanged(String value) {
//     emit(
//       state.copyWith(
//         password: value,
//         status: LoginStatus.initial,
//       ),
//     );
//   }
//
//   Future<void> logInWithCredentials() async {
//     if (state.status == LoginStatus.submitting) return;
//     emit(state.copyWith(status: LoginStatus.submitting));
//     try {
//       await _authRepository.logInWithEmailAndPassword(
//         email: state.email,
//         password: state.password,
//       );
//       emit(state.copyWith(status: LoginStatus.success));
//     } catch (_) {}
//   }
//
//   // Future<void> logInWithGoogle() async {
//   //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
//   //   try {
//   //     await _authRepository.logInWithGoogle();
//   //     emit(state.copyWith(status: FormzStatus.submissionSuccess));
//   //   } on LogInWithGoogleFailure catch (e) {
//   //     emit(
//   //       state.copyWith(
//   //         errorMessage: e.message,
//   //         status: FormzStatus.submissionFailure,
//   //       ),
//   //     );
//   //   } catch (_) {
//   //     emit(state.copyWith(status: FormzStatus.submissionFailure));
//   //   }
//   // }
// }
