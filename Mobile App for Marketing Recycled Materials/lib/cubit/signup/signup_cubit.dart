// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:trial/repositories/repositories.dart';
//
// part 'signup_state.dart';
//
// class SignupCubit extends Cubit<SignupState> {
//   SignupCubit(this._authRepository) : super(SignupState.initial());
//
//   final AuthRepository _authRepository;
//
//   void emailChanged(String value) {
//     emit(
//       state.copyWith(
//         email: value,
//         status: SignupStatus.initial,
//       ),
//     );
//   }
//
//   void passwordChanged(String value) {
//     emit(
//       state.copyWith(
//         password: value,
//         status: SignupStatus.initial,
//       ),
//     );
//   }
//
//   Future<void> signupFormSubmitted() async {
//     if (state.status == SignupStatus.submitting) return;
//     emit(state.copyWith(status: SignupStatus.submitting));
//     try {
//       await _authRepository.signup(
//         email: state.email,
//         password: state.password,
//       );
//       emit(state.copyWith(status: SignupStatus.success));
//     } catch (_) {}
//   }
//
// // Future<void> logInWithGoogle() async {
// //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
// //   try {
// //     await _authRepository.logInWithGoogle();
// //     emit(state.copyWith(status: FormzStatus.submissionSuccess));
// //   } on LogInWithGoogleFailure catch (e) {
// //     emit(
// //       state.copyWith(
// //         errorMessage: e.message,
// //         status: FormzStatus.submissionFailure,
// //       ),
// //     );
// //   } catch (_) {
// //     emit(state.copyWith(status: FormzStatus.submissionFailure));
// //   }
// // }
// }
