import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';

part 'select_tag_state.dart';

class SelectTagCubit extends Cubit<SelectTagState> {
  SelectTagCubit() : super(SelectTagState());

  void toggleTag(Tag tag) {
    final currentSelectedTag = state.selectedTag;

    // Toggle selection: If the current selected tag is the same as the new tag,
    // unselect it. Otherwise, select the new tag.
    final updatedTag = (currentSelectedTag == tag) ? null : tag;

    emit(SelectTagState(selectedTag: updatedTag));
  }

  void clearSelection() {
    emit(SelectTagState());
  }

  Tag? getSelectedTag() {
    return state.selectedTag;
  }
}
