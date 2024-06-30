part of 'tags_bloc.dart';

@immutable
abstract class TagsEvent extends Equatable {
  const TagsEvent();

  @override
  List<Object> get props => [];
}

class LoadTags extends TagsEvent {}

class UpdateTags extends TagsEvent {
  final List<Tag> tags;

  const UpdateTags(this.tags);

  @override
  List<Object> get props => [tags];
}
