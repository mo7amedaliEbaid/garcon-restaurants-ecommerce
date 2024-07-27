part of 'contact_us_bloc.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object> get props => [];
}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsSuccess extends ContactUsState {}

class ContactUsFailure extends ContactUsState {
  final String error;

  const ContactUsFailure(this.error);

  @override
  List<Object> get props => [error];
}
