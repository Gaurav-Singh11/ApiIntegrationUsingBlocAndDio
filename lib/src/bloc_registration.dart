import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/auth/auth_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/user/user_bloc.dart';

class RegisterBlocs {
  RegisterBlocs._privateConstructor();

  static List<BlocProvider> blocs(BuildContext context) => [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ];
}
