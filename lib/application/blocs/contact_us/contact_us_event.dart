part of'contact_us_bloc.dart';

abstract class ContactUsEvent extends Equatable {
  const ContactUsEvent();

  @override
  List<Object> get props => [];
}

class AddContactUs extends ContactUsEvent {
  final ContactUs contactUs;

  const AddContactUs(this.contactUs);

  @override
  List<Object> get props => [contactUs];
}