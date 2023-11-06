import 'package:netcarrots_task/src/data_layer/models/response_models/login_response_model.dart';

abstract class UserState {}

class InitialState extends UserState {}

class LoadingUserState extends UserState {}

class UserLoadedSuccessState extends UserState {
  UserLoadedSuccessState({required this.userResponse});

  final UserResponse userResponse;
}

class UserLoadedFailedState extends UserState {
  UserLoadedFailedState({required this.message});

  final String message;
}
