part of 'user_bloc.dart';

class UserState extends Equatable {
  final CurrentUser user;

  const UserState({
    required this.user,
  });

  factory UserState.initial() {
    return const UserState(user: CurrentUser());
  }

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UserState(user: $user)';

  UserState copyWith({
    CurrentUser? user,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }
}
