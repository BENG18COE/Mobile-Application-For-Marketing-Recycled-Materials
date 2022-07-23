part of 'form_bloc.dart';

abstract class FormState extends Equatable {
  const FormState();
}

class FormInitial extends FormState {
  @override
  List<Object?> get props => [];
}

class FormsValidate extends FormState {
  const FormsValidate(
      {required this.email,
      required this.password,
      required this.isEmailValid,
      required this.isPasswordValid,
      required this.isFormValid,
      required this.isLoading,
      required this.electedCategoryId,
      this.errorMessage = "",
      required this.isUserCatValid,
      required this.isNameValid,
      required this.isAgeValid,
      required this.isFormValidateFailed,
      this.displayName,
      this.userCategory,
      required this.age,
      this.isFormSuccessful = false});

  final String email;
  final String? displayName;
  final int age;
  final String? userCategory;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;
  final bool isNameValid;
  final bool isAgeValid;
  final bool isFormValidateFailed;
  final bool isLoading;
  final bool isUserCatValid;
  final String electedCategoryId;
  final String errorMessage;
  final bool isFormSuccessful;

  FormsValidate copyWith(
      {String? email,
      String? password,
      String? electedCategoryId,
      String? displayName,
      String? userCategory,
      bool? isEmailValid,
      bool? isPasswordValid,
      bool? isFormValid,
      bool? isLoading,
      int? age,
      String? errorMessage,
      bool? isUserCatValid,
      bool? isNameValid,
      bool? isAgeValid,
      bool? isFormValidateFailed,
      bool? isFormSuccessful}) {
    return FormsValidate(
        isUserCatValid: isUserCatValid ?? this.isUserCatValid,
        email: email ?? this.email,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isFormValid: isFormValid ?? this.isFormValid,
        electedCategoryId: electedCategoryId ?? this.electedCategoryId,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isNameValid: isNameValid ?? this.isNameValid,
        userCategory: userCategory ?? this.userCategory,
        age: age ?? this.age,
        isAgeValid: isAgeValid ?? this.isAgeValid,
        displayName: displayName ?? this.displayName,
        isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
        isFormSuccessful: isFormSuccessful ?? this.isFormSuccessful);
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isEmailValid,
        isPasswordValid,
        isFormValid,
        isLoading,
        errorMessage,
        isNameValid,
        displayName,
        electedCategoryId,
        age,
        isUserCatValid,
        userCategory,
        isFormValidateFailed,
        isFormSuccessful,
      ];
}
