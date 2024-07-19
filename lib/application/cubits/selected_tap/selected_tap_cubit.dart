
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedTapCubit extends Cubit<int> {
  SelectedTapCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
