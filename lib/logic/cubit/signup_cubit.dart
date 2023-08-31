import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:wykn/logic/provider/auth_provider.dart';
import 'package:wykn/logic/state/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  AuthProvider authProvider = AuthProvider();
  SignUpCubit(SignUpState initialState) : super(initialState);

  signUp() async {
    emit(state.copy());
    state.context?.loaderOverlay.show();
    emit(state.copy());
    var result = await authProvider.signUp({
      'name': state.name.text,
      'email': state.email.text,
      'password': state.passwordController.text,
      'repeat_password': state.passwordRepeatController.text,
    });
    if (kDebugMode) {
      print('============================> ${result?.errorCode}');
    }
    if (result != null && result.errorCode != null && result.errorCode! >= 400) {
      state.hasError = true;
      state.message = result.message ?? '';
      state.context?.loaderOverlay.hide();
    } else {
      state.hasError = false;
      state.message = result?.message ?? '';
      state.context?.loaderOverlay.hide();
    }

    state.isLoading = false;
    emit(state.copy());
  }

  clearError() {
    state.hasError = false;
    state.isLoading = false;
    state.message = '';
    emit(state.copy());
  }

  void changePasswordVisibility() {
    state.isPasswordVisible = !state.isPasswordVisible!;
    emit(state.copy());
  }
}
