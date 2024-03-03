import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();
  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserResponse extends GetUserState {
  final User user;
  const GetUserResponse(this.user);
  @override
  List<Object> get props => [user];
}

class GetUserError extends GetUserState {
  final String message;
  const GetUserError(this.message);
  @override
  List<Object> get props => [message];
}
