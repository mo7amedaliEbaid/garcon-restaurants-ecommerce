part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class StartUserEvent extends UserEvent {}

class GetUserEvent extends UserEvent {
  final String id;

  const GetUserEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class UserChangedEvent extends UserEvent {
  final CurrentUser user;

  const UserChangedEvent({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class UpdateUserEvent extends UserEvent {
  final CurrentUser updatedUser;
 // final User currentUser;
  final String userId;

  const UpdateUserEvent(
      {required this.userId,
 //     required this.currentUser,
      required this.updatedUser});

  @override
  List<Object> get props => [updatedUser, userId];
}

class ChangePasswordEvent extends UserEvent {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword];
}
