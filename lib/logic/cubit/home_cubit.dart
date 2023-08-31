import 'package:bloc/bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:wykn/logic/provider/auth_provider.dart';
import 'package:wykn/logic/state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  AuthProvider authProvider = AuthProvider();
  HomeCubit(HomeState initialState) : super(initialState);

  validateMeter() async {
    emit(state.copy());
    state.context?.loaderOverlay.show();
    emit(state.copy());
    var result = await authProvider.validateMeter({
      "meterNo": state.meterNo?.text,
      "accountType": state.accountType?.dropDownValue?.value,
      "service": state.serviceType?.dropDownValue?.value,
      "amount": state.amount?.text,
      "channel": "MOBILE"
    });
    if (result.errorCode! >= 400) {
      state.message = result.message;
      state.hasError = true;
      state.context?.loaderOverlay.hide();
    } else {
      state.hasError = false;
      state.data = {
        "meterNo": state.meterNo?.text,
        "accountType": state.accountType?.dropDownValue?.value,
        "service": state.serviceType?.dropDownValue?.value,
        "amount": state.amount?.text,
        "channel": state.serviceType?.dropDownValue?.name
      };
      state.electricityService = result.result;
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
}
