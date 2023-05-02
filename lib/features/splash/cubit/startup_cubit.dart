import 'package:ecommerce_app/common/cubit/common_state.dart';
import 'package:ecommerce_app/features/splash/model/startup_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpCubit extends Cubit<CommonState> {
  StartUpCubit() : super(CommonInitialState());

  fetchStartUpData() async {
    emit(CommonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(CommonSuccessState<StartUpData>(data: StartUpData(isLoggedIn: false)));
  }
}
