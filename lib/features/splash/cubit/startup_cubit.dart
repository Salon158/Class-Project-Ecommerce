import 'package:ecommerce_app/common/cubit/common_state.dart';
import 'package:ecommerce_app/features/auth/resources/user_respository.dart';
import 'package:ecommerce_app/features/splash/model/startup_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpCubit extends Cubit<CommonState> {
  final UserRepository userRepository;
  StartUpCubit({required this.userRepository}) : super(CommonInitialState());

  fetchStartUpData() async {
    emit(CommonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    await userRepository.init();
    emit(CommonSuccessState<StartUpData>(data: StartUpData(isLoggedIn: userRepository.userToken != null)));
  }
}
