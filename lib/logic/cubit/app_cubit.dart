import 'package:bloc/bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:wykn/logic/hive/hive_db.dart';
import 'package:wykn/logic/provider/auth_provider.dart';
import 'package:wykn/logic/state/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AuthProvider authProvider = AuthProvider();
  AppCubit(AppState initialState) : super(initialState) {
    initState();
    loadService();
  }

  initState() async {
    state.user = await MyHiveBox.getObject('USER_OBJECT');
    emit(state.copy());
  }

  void loadService() {
    state.electricityConstantServices = [
      const DropDownValueModel(
        name: 'Ikeja Electric',
        value: 'ikedc',
      ),
      const DropDownValueModel(
        name: 'Abuja Electricity Distribution Plc',
        value: 'aedc',
      ),
      const DropDownValueModel(
        name: 'Port Harcourt Electricity Distribution Company',
        value: 'phedc',
      ),
      const DropDownValueModel(
        name: 'Enugu Electricity Distribution Company',
        value: 'eedc',
      ),
      const DropDownValueModel(
        name: 'Ibadan Electricity Distribution Company.',
        value: 'ibedc',
      ),
      const DropDownValueModel(
        name: 'Eko Electricity Distribution Company',
        value: 'ekedc',
      ),
      const DropDownValueModel(
        name: 'Kano Electricity Distribution Company Plc',
        value: 'kedco',
      ),
    ];
    state.electricityServicesType = [
      const DropDownValueModel(
        name: 'Prepaid',
        value: 'prepaid',
      ),
      const DropDownValueModel(
        name: 'Postpaid',
        value: 'postpaid',
      ),
    ];
  }
}
