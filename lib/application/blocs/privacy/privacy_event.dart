part of 'privacy_bloc.dart';

abstract class PrivacyEvent extends Equatable {
  const PrivacyEvent();

  @override
  List<Object> get props => [];
}

class GetPrivacyEvent extends PrivacyEvent {}
