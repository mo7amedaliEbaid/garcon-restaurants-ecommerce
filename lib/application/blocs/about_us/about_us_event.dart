part of 'about_us_bloc.dart';

@sealed
abstract class AboutUsEvent extends Equatable {
  const AboutUsEvent();

  @override
  List<Object> get props => [];
}

class GetAboutUsEvent extends AboutUsEvent {}
