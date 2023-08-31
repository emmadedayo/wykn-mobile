import 'package:bloc/bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:wykn/logic/provider/auth_provider.dart';
import 'package:wykn/logic/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthProvider authProvider = AuthProvider();
  LoginCubit(LoginState initialState) : super(initialState);

  loginIn() async {
    emit(state.copy());
    state.context?.loaderOverlay.show();
    emit(state.copy());
    var result = await authProvider.auth({'email': state.emailController.text, 'password': state.passwordController.text});
    if (result.errorCode! >= 400) {
      state.message = result.message;
      state.hasError = true;
      state.context?.loaderOverlay.hide();
    } else {
      state.hasError = false;
      state.user = result.result;
      state.context?.loaderOverlay.hide();
    }
    state.context?.loaderOverlay.hide();
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
