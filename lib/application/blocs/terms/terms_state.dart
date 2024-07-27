part of 'terms_bloc.dart';

abstract class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object> get props => [];
}

class TermsInitial extends TermsState {}

class TermsLoading extends TermsState {}

class TermsLoaded extends TermsState {
  final Info terms;

  const TermsLoaded(this.terms);

  @override
  List<Object> get props => [terms];
}

class TermsError extends TermsState {
  final String error;

  const TermsError(this.error);

  @override
  List<Object> get props => [error];
}
