import 'package:ecommerce_app/features/auth/cubit/signup_cubit.dart';
import 'package:ecommerce_app/features/auth/resources/user_respository.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPages extends StatelessWidget {
  const SignupPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: SignupWidgets(),
    );
  }
}
