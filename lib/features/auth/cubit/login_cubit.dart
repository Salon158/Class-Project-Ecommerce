import 'package:ecommerce_app/common/cubit/common_state.dart';
import 'package:ecommerce_app/features/auth/model/user.dart';
import 'package:ecommerce_app/features/auth/resources/user_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<CommonState> {
  final UserRepository userRepository;
  LoginCubit({required this.userRepository}) : super(CommonInitialState());

  login({required String email, required String password}) async {
    emit(CommonLoadingState());
    final res = await userRepository.login(email: email, password: password);
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState<User>(data: data)),
    );
  }
}
