part of 'privacy_bloc.dart';

abstract class PrivacyState extends Equatable {
  const PrivacyState();

  @override
  List<Object> get props => [];
}

class PrivacyInitial extends PrivacyState {}

class PrivacyLoading extends PrivacyState {}

class PrivacyLoaded extends PrivacyState {
  final Info privacy;

  const PrivacyLoaded(this.privacy);

  @override
  List<Object> get props => [privacy];
}

class PrivacyError extends PrivacyState {
  final String error;

  const PrivacyError(this.error);

  @override
  List<Object> get props => [error];
}
