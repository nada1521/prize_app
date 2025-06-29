import 'package:bloc/bloc.dart';

class TabsCubit extends Cubit<int> {
  TabsCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
