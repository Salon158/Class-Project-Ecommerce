import 'package:ecommerce_app/common/cubit/common_state.dart';
import 'package:ecommerce_app/features/auth/resources/user_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<CommonState> {
  final UserRepository userRepository;
  SignUpCubit({required this.userRepository}) : super(CommonInitialState());

  register({
    required String name,
    required String email,
    required String password,
    required String address,
    required String phone,
  }) async {
    emit(CommonLoadingState());
    final res = await userRepository.signUp(
      name: name,
      email: email,
      password: password,
      address: address,
      phone: phone,
    );
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState(data: data)),
    );
  }
}
