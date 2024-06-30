part of 'about_us_bloc.dart';

@sealed
abstract class AboutUsState extends Equatable {
  const AboutUsState();

  @override
  List<Object> get props => [];
}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  final AboutUs aboutUs;

  const AboutUsLoaded(this.aboutUs);

  @override
  List<Object> get props => [aboutUs];
}

class AboutUsError extends AboutUsState {
  final String error;

  const AboutUsError(this.error);

  @override
  List<Object> get props => [error];
}
