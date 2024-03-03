import 'package:equatable/equatable.dart';

abstract class SaveUserState extends Equatable {
  const SaveUserState();
  @override
  List<Object> get props => [];
}

class SaveUserInitial extends SaveUserState {}

class SaveUserLoading extends SaveUserState {}

class SaveUserResponse extends SaveUserState {
  final String message;
  const SaveUserResponse(this.message);
  @override
  List<Object> get props => [message];
}
