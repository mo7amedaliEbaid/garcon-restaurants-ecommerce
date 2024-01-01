part of 'tags_bloc.dart';

@immutable
abstract class TagsState extends Equatable {
  const TagsState();

  @override
  List<Object> get props => [];
}

class TagsLoading extends TagsState {}

class TagsLoaded extends TagsState {
  final List<Tag> tags;

  const TagsLoaded({this.tags = const <Tag>[]});

  @override
  List<Object> get props => [tags];
}
